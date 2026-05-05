# frozen_string_literal: true

module Anthropic
  module Credentials
    class CredentialResult
      attr_reader :provider, :extra_headers, :base_url

      def initialize(provider:, extra_headers: {}, base_url: nil)
        @provider = provider
        @extra_headers = extra_headers
        @base_url = base_url
      end
    end

    class << self
      # Resolve a CredentialResult from the environment per the
      # credential-resolution spec. First match wins.
      #
      # Implements steps 2-5 of the spec precedence chain (step 1 is handled at
      # the client constructor level):
      #
      # Step 2a: +ANTHROPIC_API_KEY+ -> return +nil+ so the client uses its
      #          existing +X-Api-Key+ header path. (API keys are not Bearer
      #          tokens, so they can't flow through this chain.)
      # Step 2b: +ANTHROPIC_AUTH_TOKEN+ -> StaticToken (Bearer).
      # Step 3:  +ANTHROPIC_PROFILE+ set -> load that profile. This is
      #          *explicit profile selection* via env var; failures propagate.
      #          Note: the +active_config+ pointer file is **not** treated as
      #          explicit selection -- a leftover pointer from a past `ant
      #          auth login` shouldn't preempt env-var WIF.
      # Step 4:  +ANTHROPIC_FEDERATION_RULE_ID+ + +ANTHROPIC_ORGANIZATION_ID+
      #          + +ANTHROPIC_IDENTITY_TOKEN[_FILE]+ -> direct jwt-bearer
      #          exchange via WorkloadIdentity. Critically, step 4 sits
      #          *between* explicit profile (step 3) and fallback profile
      #          (step 5): a machine with WIF env vars wired up must use WIF
      #          even if a leftover +default+ profile (or active_config
      #          pointer) exists on disk, but a user who explicitly sets
      #          +ANTHROPIC_PROFILE=dev+ still gets their profile.
      # Step 5:  Fallback active profile from disk (+configs/default.json+
      #          or whatever +active_config+ points at). Errors at this step
      #          are swallowed and the chain falls through -- a corrupt
      #          unselected profile shouldn't break an otherwise-explicit
      #          api_key= path.
      #
      # Returns +nil+ when nothing matches -- the client will fall back to
      # its normal "no auth configured" error.
      def default_credentials(base_url: DEFAULT_BASE_URL)
        # Step 2a -- env api_key: return nil so the base client handles X-Api-Key.
        # Treat an empty string the same as unset, matching the Python client.
        unless ENV[ENV_API_KEY].to_s.empty?
          return nil
        end

        # Step 2b -- env auth_token: static bearer.
        # Guard against empty string: in Ruby an empty string is truthy, so
        # a bare `if auth_token` would wrap "" in a StaticToken.
        auth_token = ENV[ENV_AUTH_TOKEN]
        if auth_token && !auth_token.empty?
          return CredentialResult.new(provider: StaticToken.new(auth_token))
        end

        # Step 3 -- explicit profile selection via ANTHROPIC_PROFILE env var.
        # Failures propagate -- a user who explicitly names a profile expects
        # a broken config to surface, not to fall through. The active_config
        # pointer file is *not* considered explicit here; it's handled in
        # step 5 so env-var WIF can preempt a stale pointer.
        unless ENV[ENV_PROFILE].to_s.empty?
          creds_file = CredentialsFile.new
          creds_file.bind_base_url(base_url)
          extra_headers = creds_file.extra_headers
          return CredentialResult.new(
            provider: creds_file,
            extra_headers: extra_headers,
            base_url: creds_file.resolved_base_url
          )
        end

        # Step 4 -- env-var workload identity federation. Sits above the
        # fallback on-disk profile so a machine with WIF env vars uses WIF
        # even if a leftover +default+ profile exists on disk.
        federation_result = build_federation_result(base_url: base_url)
        return federation_result if federation_result

        # Step 5 -- fallback active profile from disk. Errors are swallowed and
        # the chain falls through because the user didn't explicitly select
        # this profile; a corrupt auto-discovered config shouldn't break
        # construction.
        #
        # Resolve the profile once and pass it explicitly: active_profile
        # reads the active_config pointer file, and handing the result to
        # CredentialsFile.new avoids a second read inside its constructor.
        profile = Credentials.active_profile
        if Credentials.config_file_path(profile).file?
          creds_file = CredentialsFile.new(profile)
          creds_file.bind_base_url(base_url)
          begin
            extra_headers = creds_file.extra_headers
          rescue Anthropic::Errors::Error
            return nil
          end
          return CredentialResult.new(
            provider: creds_file,
            extra_headers: extra_headers,
            base_url: creds_file.resolved_base_url
          )
        end

        nil
      end

      private

      # Build a Step 4 WorkloadIdentity CredentialResult from env vars, or
      # return +nil+ if the required env vars aren't all present. Requires
      # both +ANTHROPIC_FEDERATION_RULE_ID+ and +ANTHROPIC_ORGANIZATION_ID+,
      # plus either a literal +ANTHROPIC_IDENTITY_TOKEN+ or a resolvable
      # identity-token file path.
      def build_federation_result(base_url:)
        federation_rule_id = ENV[ENV_FEDERATION_RULE_ID]
        organization_id = ENV[ENV_ORGANIZATION_ID]
        has_literal_token = ENV.key?(ENV_IDENTITY_TOKEN)
        identity_token_path = Credentials.resolve_identity_token_path

        return nil unless federation_rule_id && !federation_rule_id.empty?
        return nil unless organization_id && !organization_id.empty?
        return nil unless has_literal_token || identity_token_path

        # When both ANTHROPIC_IDENTITY_TOKEN and ANTHROPIC_IDENTITY_TOKEN_FILE are set,
        # the file takes precedence. This matches the behavior of other SDKs and allows
        # the file-based approach (which supports automatic rotation) to override a
        # potentially stale literal token in the environment.
        identity_provider = if identity_token_path
          IdentityTokenFile.new(identity_token_path.to_s)
        else
          -> {
            content = ENV[ENV_IDENTITY_TOKEN]
            raise Anthropic::Errors::ConfigurationError, "#{ENV_IDENTITY_TOKEN} is not set" if content.nil?
            content = content.strip
            raise Anthropic::Errors::ConfigurationError, "#{ENV_IDENTITY_TOKEN} is empty" if content.empty?
            content
          }
        end

        provider = WorkloadIdentity.new(
          identity_token_provider: identity_provider,
          federation_rule_id: federation_rule_id,
          organization_id: organization_id,
          service_account_id: ENV[ENV_SERVICE_ACCOUNT_ID],
          # Coerce empty string to nil so a defaulted-but-empty CI variable doesn't
          # put "workspace_id" => "" on the wire — matches the blank-skip in
          # ConfigProvider#fill.
          workspace_id: ENV[ENV_WORKSPACE_ID].then { _1 unless _1.to_s.empty? },
          scope: ENV[ENV_SCOPE]
        )
        provider.bind_base_url(base_url)
        CredentialResult.new(provider: provider)
      end
    end
  end
end

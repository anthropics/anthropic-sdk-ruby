# frozen_string_literal: true

module Anthropic
  module Credentials
    # OAuth grant type for RFC 7523 JWT Bearer assertion.
    GRANT_TYPE_JWT_BEARER = "urn:ietf:params:oauth:grant-type:jwt-bearer"

    # OAuth grant type for refresh token exchange.
    GRANT_TYPE_REFRESH_TOKEN = "refresh_token"

    # Path to the OAuth token endpoint.
    TOKEN_ENDPOINT = "/v1/oauth/token"

    # Timeout in seconds for token exchange HTTP requests.
    TOKEN_EXCHANGE_TIMEOUT = 30

    # Beta header required for OAuth API requests.
    OAUTH_API_BETA_HEADER = "oauth-2025-04-20"

    # Beta header for OIDC federation routing.
    FEDERATION_BETA_HEADER = "oidc-federation-2026-04-01"

    # Seconds before expiry to attempt advisory (non-blocking) refresh.
    ADVISORY_REFRESH_SECONDS = 120

    # Seconds before expiry when refresh becomes mandatory (blocking).
    MANDATORY_REFRESH_SECONDS = 30

    # Default profile name when none is specified.
    DEFAULT_PROFILE = "default"

    # Default API base URL.
    DEFAULT_BASE_URL = "https://api.anthropic.com"

    # Environment variable for explicit API key authentication.
    ENV_API_KEY = "ANTHROPIC_API_KEY"

    # Environment variable for explicit bearer token authentication.
    ENV_AUTH_TOKEN = "ANTHROPIC_AUTH_TOKEN"

    # Environment variable for API base URL override.
    ENV_BASE_URL = "ANTHROPIC_BASE_URL"

    # Environment variable to override the config directory location.
    ENV_CONFIG_DIR = "ANTHROPIC_CONFIG_DIR"

    # Environment variable to select a specific profile.
    ENV_PROFILE = "ANTHROPIC_PROFILE"

    # Environment variable for inline identity token (not recommended).
    ENV_IDENTITY_TOKEN = "ANTHROPIC_IDENTITY_TOKEN"

    # Environment variable for path to identity token file.
    ENV_IDENTITY_TOKEN_FILE = "ANTHROPIC_IDENTITY_TOKEN_FILE"

    # Environment variable for federation rule ID.
    ENV_FEDERATION_RULE_ID = "ANTHROPIC_FEDERATION_RULE_ID"

    # Environment variable for organization ID.
    ENV_ORGANIZATION_ID = "ANTHROPIC_ORGANIZATION_ID"

    # Environment variable for service account ID.
    ENV_SERVICE_ACCOUNT_ID = "ANTHROPIC_SERVICE_ACCOUNT_ID"

    # Environment variable for workspace ID.
    ENV_WORKSPACE_ID = "ANTHROPIC_WORKSPACE_ID"

    # Environment variable for OAuth scope.
    ENV_SCOPE = "ANTHROPIC_SCOPE"

    # Config file authentication type for OIDC workload identity federation.
    AUTH_TYPE_OIDC_FEDERATION = "oidc_federation"

    # Config file authentication type for user OAuth (interactive login).
    AUTH_TYPE_USER_OAUTH = "user_oauth"

    class << self
      # Returns the config directory path.
      #
      # Resolution order:
      # 1. +ANTHROPIC_CONFIG_DIR+ environment variable
      # 2. Platform default:
      #    - Windows: +%APPDATA%\Anthropic+
      #    - Unix/macOS: +~/.config/anthropic+
      #
      # @return [Pathname] the config directory path
      def config_dir
        return Pathname.new(ENV[ENV_CONFIG_DIR]) if env_present?(ENV_CONFIG_DIR)

        if RUBY_PLATFORM =~ /mswin|mingw|cygwin/ && env_present?("APPDATA")
          return Pathname.new(ENV["APPDATA"]).join("Anthropic")
        end

        begin
          home = Dir.home
          return Pathname.new(home).join(".config", "anthropic") unless home.empty?
        rescue ArgumentError
          # Dir.home raises when HOME is unset. Fall through to the error below.
        end

        raise Anthropic::Errors::ConfigurationError,
              "Cannot determine config directory: neither #{ENV_CONFIG_DIR}, APPDATA, nor HOME is set"
      end

      # Reads the active config pointer file.
      #
      # @return [String, nil] the profile name from the pointer file, or +nil+ if
      #   the file doesn't exist or is empty
      def read_active_config_pointer
        path = config_dir.join("active_config")
        content = path.read.strip
        content.empty? ? nil : content
      rescue Errno::ENOENT, Errno::EACCES
        nil
      end

      # Returns the active profile name.
      #
      # Resolution order:
      # 1. +ANTHROPIC_PROFILE+ environment variable
      # 2. +active_config+ pointer file contents
      # 3. "default"
      #
      # @return [String] the active profile name
      def active_profile
        return ENV[ENV_PROFILE] if env_present?(ENV_PROFILE)

        pointer = read_active_config_pointer
        return pointer if pointer

        DEFAULT_PROFILE
      end

      # Returns the path to a profile's config file.
      #
      # @param profile [String] the profile name
      # @return [Pathname] path to +<config_dir>/configs/<profile>.json+
      def config_file_path(profile)
        base = config_dir
        base.join("configs", "#{profile}.json")
      end

      # Checks if the active profile has a config file.
      #
      # @return [Boolean] true if the config file exists
      def active_profile_config?
        config_file_path(active_profile).file?
      rescue StandardError
        false
      end

      # Checks if there's an explicit active_config pointer file.
      #
      # @return [Boolean] true if the pointer file exists and is non-empty
      def explicit_active_config?
        !read_active_config_pointer.nil?
      end

      # Resolves an identity token file path.
      #
      # @param path [String, nil] explicit path, or +nil+ to use environment variable
      # @return [Pathname, nil] the resolved path, or +nil+ if not available
      def resolve_identity_token_path(path = nil)
        return Pathname.new(path) if path
        return Pathname.new(ENV[ENV_IDENTITY_TOKEN_FILE]) if env_present?(ENV_IDENTITY_TOKEN_FILE)

        nil
      end

      # Checks if auto-discoverable credentials are available.
      #
      # Returns true if the environment or filesystem contains signals that would
      # drive the tier-1 (profile) or tier-2 (env federation) credential paths.
      # Used for shadow-warning detection in the client constructor.
      #
      # @return [Boolean] true if auto-discoverable credentials are present
      def auto_discoverable_credentials?
        return true if env_present?(ENV_PROFILE)
        return true if env_present?(ENV_CONFIG_DIR)
        return true if explicit_active_config?
        return true if federation_configured?

        false
      end

      private

      def env_present?(key)
        value = ENV[key]
        value && !value.empty?
      end

      def federation_configured?
        env_present?(ENV_FEDERATION_RULE_ID) &&
          env_present?(ENV_ORGANIZATION_ID) &&
          (env_present?(ENV_IDENTITY_TOKEN) || env_present?(ENV_IDENTITY_TOKEN_FILE))
      end
    end
  end
end

# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Plugins
          class Shares
            # List the shares the owner of a member-owned Plugin has given — to every member
            # of the organization, to an RBAC Group, or to one member — most recently granted
            # first.
            #
            # Shares are read-only in this API: members give and withdraw them in claude.ai,
            # and who gave a share is recorded on the Compliance API activity feed rather than
            # on the share. An organization-owned Plugin has installation settings instead, so
            # this path returns 404 for one.
            #
            # **Accepted credentials:** an Admin API key with the `read:plugins` or
            # `read:org_audit` scope, or a Compliance Access Key with the
            # `read:compliance_org_data` scope.
            #
            # Every request must include the beta header
            # `anthropic-beta: ce-plugins-2026-09-01`. A request without it returns `404`,
            # exactly as if the endpoint did not exist. The Plugins API is in beta and is
            # available to Claude Enterprise organizations only. It is not available to Claude
            # Platform (Claude Console) organizations, or to organizations with HIPAA
            # readiness enabled.
            sig do
              params(
                plugin_id: String,
                limit: Integer,
                organization_id: T.nilable(String),
                page: T.nilable(String),
                target_type:
                  T.nilable(
                    Anthropic::Beta::Organization::Plugins::ShareListParams::TargetType::OrSymbol
                  ),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::Plugins::BetaPluginShare
                ]
              )
            end
            def list(
              # Path param: ID of the Plugin (prefixed `plugin_`).
              plugin_id,
              # Query param: Number of items to return per page.
              #
              # Defaults to `20`. Ranges from `1` to `100`.
              limit: nil,
              # Query param: For a `read:org_audit` or `read:compliance_org_data` key created
              # for all of a parent organization's linked organizations: a child organization of
              # that parent to read instead of the organization the key was created in, given as
              # the organization's UUID or its `org_`-prefixed ID. A value that is neither
              # returns a 400; an organization that is not a child of the key's parent, or where
              # the Plugins API is not available, returns a 404. Any other key may pass only its
              # own organization's ID here; another organization returns a 404.
              organization_id: nil,
              # Query param: Optionally set to the `next_page` token from the previous response.
              page: nil,
              # Query param: Only shares with this kind of target: `organization` (every
              # member), `rbac_group` (one RBAC Group), or `organization_member` (one member).
              target_type: nil,
              # Header param: This endpoint is in beta: requests must send
              # `ce-plugins-2026-09-01` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end

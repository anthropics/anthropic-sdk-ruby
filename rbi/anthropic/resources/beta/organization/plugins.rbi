# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Plugins
          sig do
            returns(Anthropic::Resources::Beta::Organization::Plugins::Versions)
          end
          attr_reader :versions

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Plugins::InstallationSettings
            )
          end
          attr_reader :installation_settings

          sig do
            returns(Anthropic::Resources::Beta::Organization::Plugins::Shares)
          end
          attr_reader :shares

          # Create an organization-owned Plugin and its first version by uploading the
          # version's files.
          #
          # The upload is `multipart/form-data`: the version's files (`files`, each part
          # sent as `files[]`), with an optional `marketplace_id` and `release_notes`. The
          # manifest's `name` becomes the Plugin's `name`, and `display_name`, `description`
          # and `manifest_version` come from the manifest too.
          #
          # `name` may contain lowercase letters (from any alphabet), digits, and hyphens,
          # up to 64 characters. Uppercase letters, spaces, underscores, and other
          # punctuation are rejected.
          #
          # The `name` must be unique within the marketplace: a name already taken returns a
          # 409 with `error_code` `plugin_name_taken` and, when a Plugin holds it, that
          # Plugin's ID in `details.plugin_id`. A Plugin going into the organization's
          # library marketplace is also refused with a 409 when one of its skills has the
          # name of an organization skill (a skill an administrator uploaded for the whole
          # organization in claude.ai): `error_code` `skill_name_taken`, with that name in
          # `details.skill_name`; rename the skill, or remove the organization skill in
          # claude.ai. A 503 with `error_code` `registration_pending` means the Plugin and
          # its version were stored (their IDs are in `details`) but are not yet usable in
          # claude.ai: do not retry the create (the retry would return `plugin_name_taken`);
          # create a version on the stored Plugin instead, which completes it.
          #
          # For a worked example, see
          # [Create a plugin](/docs/en/manage-claude/plugins-api#create-a-plugin) in the
          # Plugins API guide.
          #
          # **Accepted credentials:** an Admin API key with the `write:plugins` scope.
          #
          # Every request must include the beta header
          # `anthropic-beta: ce-plugins-2026-09-01`. A request without it returns `404`,
          # exactly as if the endpoint did not exist. The Plugins API is in beta and is
          # available to Claude Enterprise organizations only. It is not available to Claude
          # Platform (Claude Console) organizations, or to organizations with HIPAA
          # readiness enabled.
          sig do
            params(
              files: T::Array[Anthropic::Internal::FileInput],
              marketplace_id: String,
              release_notes: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaPlugin)
          end
          def create(
            # Body param: The version's files: one part per file, the part's filename being
            # the file's path within the Plugin (for example `skills/review-pr/SKILL.md`), or
            # a single `.zip` or `.plugin` archive holding them all. On the wire each part is
            # named `files[]`, and a part named plain `files` is not read; with cURL,
            # `-F 'files[]=@SKILL.md;filename=skills/review-pr/SKILL.md'`. The files must
            # include the manifest, `.claude-plugin/plugin.json`.
            files:,
            # Body param: ID of the organization-owned plugin marketplace to create the Plugin
            # in (prefixed `marketplace_`). It must be a `manual` marketplace, one whose
            # Plugins are uploaded rather than synchronized from a repository. When omitted,
            # the Plugin is created in the organization's library marketplace, an
            # organization-owned `manual` marketplace created on first use.
            marketplace_id: nil,
            # Body param: Release notes stored with the version and shown in its version
            # history in claude.ai; up to 5,000 characters.
            release_notes: nil,
            # Header param: This endpoint is in beta: requests must send
            # `ce-plugins-2026-09-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          # Retrieve a Plugin by ID.
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
              organization_id: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaPlugin)
          end
          def retrieve(
            # Path param: ID of the Plugin (prefixed `plugin_`).
            plugin_id,
            # Query param: For a `read:org_audit` or `read:compliance_org_data` key created
            # for all of a parent organization's linked organizations: a child organization of
            # that parent to read instead of the organization the key was created in, given as
            # the organization's UUID or its `org_`-prefixed ID. A value that is neither
            # returns a 400; an organization that is not a child of the key's parent, or where
            # the Plugins API is not available, returns a 404. Any other key may pass only its
            # own organization's ID here; another organization returns a 404.
            organization_id: nil,
            # Header param: This endpoint is in beta: requests must send
            # `ce-plugins-2026-09-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          # Change which stored version of an organization-owned Plugin is served to
          # members, for example to roll back to an earlier one. This pins the served
          # version: later uploads are stored but no longer change what is served, and
          # pinning cannot currently be undone, here or in claude.ai.
          #
          # Pass the version as `served_version_id`: an earlier one to roll back, a later
          # one to start serving a version that was stored without being served, or the one
          # already served to pin it without changing what is served. No new version is
          # created.
          #
          # When the organization has content scanning enabled, a version whose scan is
          # still running is refused with a 409 (`error_code` `scan_pending`; retry once the
          # scan finishes) and one whose scan failed, errored or reached no verdict with a
          # 400 (`scan_failed`; a `warn` is accepted). When the Plugin is in the
          # organization's library marketplace, a version other than the one served is also
          # refused with a 409 when one of its skills has a name that an organization skill
          # (one an administrator uploaded for the whole organization in claude.ai) has
          # since taken: `error_code` `skill_name_taken`, with that name in
          # `details.skill_name`. A member-owned Plugin cannot be updated here (403).
          #
          # This endpoint does not write installation settings; they are written at
          # `/v1/organizations/plugins/{plugin_id}/installation_settings/{target}`.
          #
          # **Accepted credentials:** an Admin API key with the `write:plugins` scope.
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
              served_version_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaPlugin)
          end
          def update(
            # Path param: ID of the Plugin (prefixed `plugin_`).
            plugin_id,
            # Body param: Serve this version of the Plugin (prefixed `pluginver_`) and pin the
            # served version to it; `latest` is not accepted.
            served_version_id:,
            # Header param: This endpoint is in beta: requests must send
            # `ce-plugins-2026-09-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          # List the Plugins created under the organization, newest first: those in the
          # organization's own plugin marketplaces and those in members' personal plugin
          # marketplaces.
          #
          # Plugins in members' personal marketplaces are listed with the same detail as the
          # organization's own, and their files can be downloaded through the version
          # archive endpoint, which records each such download on the Compliance API
          # activity feed.
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
              created_at_gt: T.nilable(Time),
              created_at_gte: T.nilable(Time),
              created_at_lt: T.nilable(Time),
              created_at_lte: T.nilable(Time),
              limit: Integer,
              marketplace_id: T.nilable(String),
              organization_id: T.nilable(String),
              owner_type:
                T.nilable(
                  Anthropic::Beta::Organization::PluginListParams::OwnerType::OrSymbol
                ),
              owner_user_id: T.nilable(String),
              page: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaPlugin
              ]
            )
          end
          def list(
            # Query param: RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
            created_at_gt: nil,
            # Query param: RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
            created_at_gte: nil,
            # Query param: RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
            created_at_lt: nil,
            # Query param: RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
            created_at_lte: nil,
            # Query param: Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `100`.
            limit: nil,
            # Query param: Only Plugins in this plugin marketplace (prefixed `marketplace_`).
            marketplace_id: nil,
            # Query param: For a `read:org_audit` or `read:compliance_org_data` key created
            # for all of a parent organization's linked organizations: a child organization of
            # that parent to read instead of the organization the key was created in, given as
            # the organization's UUID or its `org_`-prefixed ID. A value that is neither
            # returns a 400; an organization that is not a child of the key's parent, or where
            # the Plugins API is not available, returns a 404. Any other key may pass only its
            # own organization's ID here; another organization returns a 404.
            organization_id: nil,
            # Query param: `organization` for Plugins in the organization's plugin
            # marketplaces, `user` for Plugins in members' personal plugin marketplaces.
            owner_type: nil,
            # Query param: Only Plugins in this member's personal plugin marketplaces
            # (prefixed `user_`); a removed member's ID is accepted.
            owner_user_id: nil,
            # Query param: Optionally set to the `next_page` token from the previous response.
            page: nil,
            # Header param: This endpoint is in beta: requests must send
            # `ce-plugins-2026-09-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          # Permanently delete a Plugin and every version it holds, exactly as when an
          # administrator deletes it in claude.ai. The Plugin may belong to the organization
          # or to a member, including a member who has since left the organization.
          #
          # An organization-owned Plugin's installation settings go with it; a member-owned
          # Plugin's shares are withdrawn and its owner no longer has it.
          #
          # To take an organization-owned Plugin out of use reversibly, set its
          # organization-wide installation setting to `not_available` instead (and remove or
          # change any group settings, which override it for their members). Only a Plugin
          # in a `manual` marketplace can be deleted here; one synchronized from a
          # repository is removed by removing it from the repository (400).
          #
          # **Accepted credentials:** an Admin API key with the `write:plugins` scope.
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
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaDeletedPlugin)
          end
          def delete(
            # ID of the Plugin (prefixed `plugin_`).
            plugin_id,
            # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
            # header.
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

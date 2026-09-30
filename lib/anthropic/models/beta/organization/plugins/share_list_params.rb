# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          # @see Anthropic::Resources::Beta::Organization::Plugins::Shares#list
          class ShareListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute plugin_id
            #   ID of the Plugin (prefixed `plugin_`).
            #
            #   @return [String]
            required :plugin_id, String

            # @!attribute limit
            #   Number of items to return per page.
            #
            #   Defaults to `20`. Ranges from `1` to `100`.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute organization_id
            #   For a `read:org_audit` or `read:compliance_org_data` key created for all of a
            #   parent organization's linked organizations: a child organization of that parent
            #   to read instead of the organization the key was created in, given as the
            #   organization's UUID or its `org_`-prefixed ID. A value that is neither returns a
            #   400; an organization that is not a child of the key's parent, or where the
            #   Plugins API is not available, returns a 404. Any other key may pass only its own
            #   organization's ID here; another organization returns a 404.
            #
            #   @return [String, nil]
            optional :organization_id, String, nil?: true

            # @!attribute page
            #   Optionally set to the `next_page` token from the previous response.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!attribute target_type
            #   Only shares with this kind of target: `organization` (every member),
            #   `rbac_group` (one RBAC Group), or `organization_member` (one member).
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Plugins::ShareListParams::TargetType, nil]
            optional :target_type,
                     enum: -> { Anthropic::Beta::Organization::Plugins::ShareListParams::TargetType },
                     nil?: true

            # @!attribute betas
            #   This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
            #   header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(plugin_id:, limit: nil, organization_id: nil, page: nil, target_type: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Plugins::ShareListParams} for more
            #   details.
            #
            #   @param plugin_id [String] ID of the Plugin (prefixed `plugin_`).
            #
            #   @param limit [Integer] Number of items to return per page.
            #
            #   @param organization_id [String, nil] For a `read:org_audit` or `read:compliance_org_data` key created for all of a pa
            #
            #   @param page [String, nil] Optionally set to the `next_page` token from the previous response.
            #
            #   @param target_type [Symbol, Anthropic::Models::Beta::Organization::Plugins::ShareListParams::TargetType, nil] Only shares with this kind of target: `organization` (every member), `rbac_group
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

            # Only shares with this kind of target: `organization` (every member),
            # `rbac_group` (one RBAC Group), or `organization_member` (one member).
            module TargetType
              extend Anthropic::Internal::Type::Enum

              ORGANIZATION = :organization
              ORGANIZATION_MEMBER = :organization_member
              RBAC_GROUP = :rbac_group

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end

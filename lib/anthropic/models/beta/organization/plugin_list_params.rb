# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Plugins#list
        class PluginListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute created_at_gt
          #   RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          #   @return [Time, nil]
          optional :created_at_gt, Time, nil?: true

          # @!attribute created_at_gte
          #   RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          #   @return [Time, nil]
          optional :created_at_gte, Time, nil?: true

          # @!attribute created_at_lt
          #   RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          #   @return [Time, nil]
          optional :created_at_lt, Time, nil?: true

          # @!attribute created_at_lte
          #   RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          #   @return [Time, nil]
          optional :created_at_lte, Time, nil?: true

          # @!attribute limit
          #   Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `100`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute marketplace_id
          #   Only Plugins in this plugin marketplace (prefixed `marketplace_`).
          #
          #   @return [String, nil]
          optional :marketplace_id, String, nil?: true

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

          # @!attribute owner_type
          #   `organization` for Plugins in the organization's plugin marketplaces, `user` for
          #   Plugins in members' personal plugin marketplaces.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::PluginListParams::OwnerType, nil]
          optional :owner_type,
                   enum: -> {
                     Anthropic::Beta::Organization::PluginListParams::OwnerType
                   },
                   nil?: true

          # @!attribute owner_user_id
          #   Only Plugins in this member's personal plugin marketplaces (prefixed `user_`); a
          #   removed member's ID is accepted.
          #
          #   @return [String, nil]
          optional :owner_user_id, String, nil?: true

          # @!attribute page
          #   Optionally set to the `next_page` token from the previous response.
          #
          #   @return [String, nil]
          optional :page, String, nil?: true

          # @!attribute betas
          #   This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, marketplace_id: nil, organization_id: nil, owner_type: nil, owner_user_id: nil, page: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::PluginListParams} for more details.
          #
          #   @param created_at_gt [Time, nil] RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          #   @param created_at_gte [Time, nil] RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          #   @param created_at_lt [Time, nil] RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          #   @param created_at_lte [Time, nil] RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          #   @param limit [Integer] Number of items to return per page.
          #
          #   @param marketplace_id [String, nil] Only Plugins in this plugin marketplace (prefixed `marketplace_`).
          #
          #   @param organization_id [String, nil] For a `read:org_audit` or `read:compliance_org_data` key created for all of a pa
          #
          #   @param owner_type [Symbol, Anthropic::Models::Beta::Organization::PluginListParams::OwnerType, nil] `organization` for Plugins in the organization's plugin marketplaces, `user` for
          #
          #   @param owner_user_id [String, nil] Only Plugins in this member's personal plugin marketplaces (prefixed `user_`); a
          #
          #   @param page [String, nil] Optionally set to the `next_page` token from the previous response.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # `organization` for Plugins in the organization's plugin marketplaces, `user` for
          # Plugins in members' personal plugin marketplaces.
          module OwnerType
            extend Anthropic::Internal::Type::Enum

            ORGANIZATION = :organization
            USER = :user

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end

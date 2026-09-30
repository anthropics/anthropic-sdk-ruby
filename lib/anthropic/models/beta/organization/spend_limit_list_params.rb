# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::SpendLimits#list
        class SpendLimitListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute limit
          #   Maximum number of limits per page. Defaults to `20`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   Opaque cursor from a previous response's `next_page` field.
          #
          #   @return [String, nil]
          optional :page, String, nil?: true

          # @!attribute scope_type
          #   Return only limits with these scope types. A Claude Console organization has
          #   `organization` and `workspace` limits; a Claude Enterprise organization has
          #   `organization`, `seat_tier`, `rbac_group`, `organization_service` and `user`
          #   limits. Omit for all.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimitListParams::ScopeType>, nil]
          optional :scope_type,
                   -> {
                     Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::SpendLimitListParams::ScopeType]
                   },
                   nil?: true

          # @!attribute betas
          #   This endpoint is in beta: requests must send `spend-limit-reads-2026-09-26` in
          #   this header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(limit: nil, page: nil, scope_type: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::SpendLimitListParams} for more details.
          #
          #   @param limit [Integer] Maximum number of limits per page. Defaults to `20`.
          #
          #   @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
          #
          #   @param scope_type [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimitListParams::ScopeType>, nil] Return only limits with these scope types. A Claude Console organization has `or
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `spend-limit-reads-2026-09-26` in t
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          module ScopeType
            extend Anthropic::Internal::Type::Enum

            ORGANIZATION = :organization
            ORGANIZATION_SERVICE = :organization_service
            RBAC_GROUP = :rbac_group
            SEAT_TIER = :seat_tier
            USER = :user
            WORKSPACE = :workspace

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          # @see Anthropic::Resources::Beta::Organization::SpendLimits::Effective#list
          class EffectiveListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute limit
            #   Maximum number of members per page. A member's period rows never split across
            #   pages, so a page may carry more rows than this. Defaults to `20`.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page` field.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!attribute period
            #   Restrict the report to these limit periods. Omit to return one row per period
            #   each member resolves a spend limit for.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimits::EffectiveListParams::Period>, nil]
            optional :period,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::SpendLimits::EffectiveListParams::Period]
                     },
                     nil?: true

            # @!attribute user_ids
            #   Restrict the report to these members, by tagged user ID (`user_...`). At most
            #   100 entries.
            #
            #   @return [Array<String>, nil]
            optional :user_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!method initialize(limit: nil, page: nil, period: nil, user_ids: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::SpendLimits::EffectiveListParams} for
            #   more details.
            #
            #   @param limit [Integer] Maximum number of members per page. A member's period rows never split across pa
            #
            #   @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            #   @param period [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimits::EffectiveListParams::Period>, nil] Restrict the report to these limit periods. Omit to return one row per period ea
            #
            #   @param user_ids [Array<String>, nil] Restrict the report to these members, by tagged user ID (`user_...`). At most 10
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

            module Period
              extend Anthropic::Internal::Type::Enum

              DAILY = :daily
              MONTHLY = :monthly
              WEEKLY = :weekly

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end

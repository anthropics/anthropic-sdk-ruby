# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class BetaWorkspaceRateLimitUpdateValue < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   Rate limiter type. `input_tokens_per_minute` counts every input token, cache
            #   reads included. `input_tokens_per_minute_cache_aware` does not count cache
            #   reads, and on current models the organization's input-token limit usually has
            #   this type. A workspace limit of either type applies alongside the organization's
            #   limit, not in place of it. Because cache reads count toward an
            #   `input_tokens_per_minute` limit, it can reject requests that read mostly from
            #   the cache while the organization's limit still has room.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType]
            required :type, enum: -> { Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType }

            # @!attribute value
            #   New limit value. Set to null to clear the workspace override and fall back to
            #   the organization limit.
            #
            #   @return [Integer, nil]
            required :value, Integer, nil?: true

            # @!method initialize(type:, value:)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitUpdateValue}
            #   for more details.
            #
            #   @param type [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType] Rate limiter type. `input_tokens_per_minute` counts every input token, cache rea
            #
            #   @param value [Integer, nil] New limit value. Set to null to clear the workspace override and fall back to th
          end
        end
      end
    end
  end
end

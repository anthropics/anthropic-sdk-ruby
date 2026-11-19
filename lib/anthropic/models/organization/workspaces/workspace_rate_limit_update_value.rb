# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Workspaces
        class WorkspaceRateLimitUpdateValue < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Rate limiter type. `input_tokens_per_minute` counts every input token, cache
          #   reads included. `input_tokens_per_minute_cache_aware` does not count cache
          #   reads, and on current models the organization's input-token limit usually has
          #   this type. A workspace limit of either type applies alongside the organization's
          #   limit, not in place of it. Because cache reads count toward an
          #   `input_tokens_per_minute` limit, it can reject requests that read mostly from
          #   the cache while the organization's limit still has room.
          #
          #   @return [Symbol, Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitType]
          required :type, enum: -> { Anthropic::Organization::Workspaces::WorkspaceRateLimitType }

          # @!attribute value
          #   New limit value. Set to null to clear the workspace override and fall back to
          #   the organization limit.
          #
          #   @return [Integer, nil]
          required :value, Integer, nil?: true

          # @!method initialize(type:, value:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitUpdateValue} for
          #   more details.
          #
          #   @param type [Symbol, Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitType] Rate limiter type. `input_tokens_per_minute` counts every input token, cache rea
          #
          #   @param value [Integer, nil] New limit value. Set to null to clear the workspace override and fall back to th
        end
      end

      WorkspaceRateLimitUpdateValue = Workspaces::WorkspaceRateLimitUpdateValue
    end
  end
end

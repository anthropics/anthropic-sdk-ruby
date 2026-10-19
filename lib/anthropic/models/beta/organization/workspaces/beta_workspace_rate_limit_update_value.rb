# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class BetaWorkspaceRateLimitUpdateValue < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   Rate limiter type.
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
            #   @param type [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitType] Rate limiter type.
            #
            #   @param value [Integer, nil] New limit value. Set to null to clear the workspace override and fall back to th
          end
        end
      end
    end
  end
end

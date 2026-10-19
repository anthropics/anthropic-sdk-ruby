# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Workspaces
        class WorkspaceRateLimitUpdateValue < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Rate limiter type.
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
          #   @param type [Symbol, Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitType] Rate limiter type.
          #
          #   @param value [Integer, nil] New limit value. Set to null to clear the workspace override and fall back to th
        end
      end

      WorkspaceRateLimitUpdateValue = Workspaces::WorkspaceRateLimitUpdateValue
    end
  end
end

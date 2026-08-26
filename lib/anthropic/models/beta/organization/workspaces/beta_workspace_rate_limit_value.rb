# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class BetaWorkspaceRateLimitValue < Anthropic::Internal::Type::BaseModel
            # @!attribute org_limit
            #   The organization-level value for the same limiter type, for reference. `null`
            #   when the organization has no limit configured for this limiter type.
            #
            #   @return [Integer, nil]
            required :org_limit, Integer, nil?: true

            # @!attribute type
            #   The limiter type (for example, `requests_per_minute` or
            #   `input_tokens_per_minute`).
            #
            #   @return [String]
            required :type, String

            # @!attribute value
            #   The workspace-level override value for this limiter type.
            #
            #   @return [Integer]
            required :value, Integer

            # @!method initialize(org_limit:, type:, value:)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue}
            #   for more details.
            #
            #   @param org_limit [Integer, nil] The organization-level value for the same limiter type, for reference. `null` wh
            #
            #   @param type [String] The limiter type (for example, `requests_per_minute` or `input_tokens_per_minute
            #
            #   @param value [Integer] The workspace-level override value for this limiter type.
          end
        end
      end
    end
  end
end

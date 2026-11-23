# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnthropicHumanReviewParam < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnthropicHumanReviewParam::Type]
          required :type, enum: -> { Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::Type }

          # @!method initialize(type:)
          #   Whether Anthropic's human review applies to the Workspace's inference data.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Organization::BetaAnthropicHumanReviewParam::Type]

          # @see Anthropic::Models::Beta::Organization::BetaAnthropicHumanReviewParam#type
          module Type
            extend Anthropic::Internal::Type::Enum

            DISABLED = :disabled
            ENABLED = :enabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end

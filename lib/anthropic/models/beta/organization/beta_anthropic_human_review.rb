# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnthropicHumanReview < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnthropicHumanReview::Type]
          required :type, enum: -> { Anthropic::Beta::Organization::BetaAnthropicHumanReview::Type }

          # @!method initialize(type:)
          #   The Workspace's human review setting.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Organization::BetaAnthropicHumanReview::Type]

          # @see Anthropic::Models::Beta::Organization::BetaAnthropicHumanReview#type
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

# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAccessTransparency < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAccessTransparency::Type]
          required :type, enum: -> { Anthropic::Beta::Organization::BetaAccessTransparency::Type }

          # @!method initialize(type:)
          #   Whether Access Transparency is on. Read-only.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Organization::BetaAccessTransparency::Type]

          # @see Anthropic::Models::Beta::Organization::BetaAccessTransparency#type
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

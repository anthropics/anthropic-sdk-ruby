# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagGuestPolicyRestrict < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :restrict]
          required :type, const: :restrict

          # @!method initialize(type: :restrict)
          #   Claude does not answer in the channel.
          #
          #   @param type [Symbol, :restrict]
        end
      end
    end
  end
end

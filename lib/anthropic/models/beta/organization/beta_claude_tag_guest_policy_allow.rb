# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagGuestPolicyAllow < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :allow]
          required :type, const: :allow

          # @!method initialize(type: :allow)
          #   Claude answers in the channel.
          #
          #   @param type [Symbol, :allow]
        end
      end
    end
  end
end

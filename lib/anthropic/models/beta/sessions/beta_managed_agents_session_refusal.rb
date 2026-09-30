# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRefusal < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :refusal]
          required :type, const: :refusal

          # @!method initialize(type: :refusal)
          #   The turn ended because the model's response was refused, for example by a safety
          #   classifier.
          #
          #   @param type [Symbol, :refusal]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInternalStorage < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :internal]
          required :type, const: :internal

          # @!method initialize(type: :internal)
          #   No External Storage for this purpose.
          #
          #   @param type [Symbol, :internal]
        end
      end
    end
  end
end

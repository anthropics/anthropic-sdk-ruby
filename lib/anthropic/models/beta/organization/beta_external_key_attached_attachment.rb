# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalKeyAttachedAttachment < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :attached]
          required :type, const: :attached

          # @!method initialize(type: :attached)
          #   @param type [Symbol, :attached]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalKeyUnattachedAttachment < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :unattached]
          required :type, const: :unattached

          # @!method initialize(type: :unattached)
          #   @param type [Symbol, :unattached]
        end
      end
    end
  end
end

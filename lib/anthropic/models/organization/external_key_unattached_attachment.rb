# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class ExternalKeyUnattachedAttachment < Anthropic::Internal::Type::BaseModel
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

# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class GCPExternalKeyConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute key_name
        #   Full resource name of the Cloud KMS key.
        #
        #   @return [String]
        required :key_name, String

        # @!attribute type
        #
        #   @return [Symbol, :gcp]
        required :type, const: :gcp

        # @!method initialize(key_name:, type: :gcp)
        #   @param key_name [String] Full resource name of the Cloud KMS key.
        #
        #   @param type [Symbol, :gcp]
      end
    end
  end
end

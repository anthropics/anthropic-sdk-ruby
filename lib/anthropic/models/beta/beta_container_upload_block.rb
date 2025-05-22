# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContainerUploadBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute file_id
        #
        #   @return [String]
        required :file_id, String

        # @!attribute type
        #
        #   @return [Symbol, :container_upload]
        required :type, const: :container_upload

        # @!method initialize(file_id:, type: :container_upload)
        #   Response model for a file uploaded to the container.
        #
        #   @param file_id [String]
        #   @param type [Symbol, :container_upload]
      end
    end

    BetaContainerUploadBlock = Beta::BetaContainerUploadBlock
  end
end

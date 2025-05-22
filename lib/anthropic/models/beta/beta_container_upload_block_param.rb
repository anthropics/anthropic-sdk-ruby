# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContainerUploadBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute file_id
        #
        #   @return [String]
        required :file_id, String

        # @!attribute type
        #
        #   @return [Symbol, :container_upload]
        required :type, const: :container_upload

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(file_id:, cache_control: nil, type: :container_upload)
        #   A content block that represents a file to be uploaded to the container Files
        #   uploaded via this block will be available in the container's input directory.
        #
        #   @param file_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :container_upload]
      end
    end

    BetaContainerUploadBlockParam = Beta::BetaContainerUploadBlockParam
  end
end

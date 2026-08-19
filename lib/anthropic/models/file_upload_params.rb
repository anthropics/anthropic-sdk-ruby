# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Files#upload
    class FileUploadParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute file
      #   The file to upload
      #
      #   @return [Pathname, StringIO, IO, String, Anthropic::FilePart]
      required :file, Anthropic::Internal::Type::FileInput

      # @!attribute expires_in_seconds
      #   Seconds from upload until the file expires and its bytes become permanently
      #   unavailable. Must be between 3600 (one hour) and 7776000 (ninety days).
      #
      #   @return [Integer, nil]
      optional :expires_in_seconds, Integer

      # @!method initialize(file:, expires_in_seconds: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::FileUploadParams} for more details.
      #
      #   @param file [Pathname, StringIO, IO, String, Anthropic::FilePart] The file to upload
      #
      #   @param expires_in_seconds [Integer] Seconds from upload until the file expires and its bytes become permanently unav
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

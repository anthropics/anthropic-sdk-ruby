# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Files#upload
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

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(file:, expires_in_seconds: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::FileUploadParams} for more details.
        #
        #   @param file [Pathname, StringIO, IO, String, Anthropic::FilePart] The file to upload
        #
        #   @param expires_in_seconds [Integer] Seconds from upload until the file expires and its bytes become permanently unav
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

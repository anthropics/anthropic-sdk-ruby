# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Files#upload
      class FileUploadParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute file
        #   The file to upload. Only the final path component of the part's `filename` is
        #   kept; an absent or empty `filename` is replaced with `unnamed` plus the
        #   extension for the file's stored `mime_type`, when known.
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

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!method initialize(file:, expires_in_seconds: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::FileUploadParams} for more details.
        #
        #   @param file [Pathname, StringIO, IO, String, Anthropic::FilePart] The file to upload. Only the final path component of the part's `filename` is ke
        #
        #   @param expires_in_seconds [Integer] Seconds from upload until the file expires and its bytes become permanently unav
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param workspace_id [String]
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

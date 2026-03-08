# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Files#download
      class FileDownloadParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute file_id
        #   ID of the File.
        #
        #   @return [String]
        required :file_id, String

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(file_id:, betas: nil, request_options: {})
        #   @param file_id [String] ID of the File.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

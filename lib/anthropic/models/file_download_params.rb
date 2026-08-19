# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Files#download
    class FileDownloadParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute file_id
      #   ID of the File.
      #
      #   @return [String]
      required :file_id, String

      # @!method initialize(file_id:, request_options: {})
      #   @param file_id [String] ID of the File.
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

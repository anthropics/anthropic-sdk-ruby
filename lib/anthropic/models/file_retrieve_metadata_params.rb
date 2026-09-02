# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Files#retrieve_metadata
    class FileRetrieveMetadataParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute file_id
      #   ID of the File.
      #
      #   @return [String]
      required :file_id, String

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!method initialize(file_id:, workspace_id: nil, request_options: {})
      #   @param file_id [String] ID of the File.
      #
      #   @param workspace_id [String]
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

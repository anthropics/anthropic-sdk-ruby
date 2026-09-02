# typed: strong

module Anthropic
  module Models
    class FileDownloadParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::FileDownloadParams, Anthropic::Internal::AnyHash)
        end

      # ID of the File.
      sig { returns(String) }
      attr_accessor :file_id

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig do
        params(
          file_id: String,
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the File.
        file_id:,
        workspace_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file_id: String,
            workspace_id: String,
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

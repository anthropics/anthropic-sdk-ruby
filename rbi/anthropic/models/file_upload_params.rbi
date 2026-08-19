# typed: strong

module Anthropic
  module Models
    class FileUploadParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::FileUploadParams, Anthropic::Internal::AnyHash)
        end

      # The file to upload
      sig { returns(Anthropic::Internal::FileInput) }
      attr_accessor :file

      # Seconds from upload until the file expires and its bytes become permanently
      # unavailable. Must be between 3600 (one hour) and 7776000 (ninety days).
      sig { returns(T.nilable(Integer)) }
      attr_reader :expires_in_seconds

      sig { params(expires_in_seconds: Integer).void }
      attr_writer :expires_in_seconds

      sig do
        params(
          file: Anthropic::Internal::FileInput,
          expires_in_seconds: Integer,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The file to upload
        file:,
        # Seconds from upload until the file expires and its bytes become permanently
        # unavailable. Must be between 3600 (one hour) and 7776000 (ninety days).
        expires_in_seconds: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file: Anthropic::Internal::FileInput,
            expires_in_seconds: Integer,
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

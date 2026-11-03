# typed: strong

module Anthropic
  module Models
    class RequestBodyTooLargeAfterDecodingErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RequestBodyTooLargeAfterDecodingErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The compressed request body exceeds the request size limit once decoded.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :request_body_too_large_after_decoding)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

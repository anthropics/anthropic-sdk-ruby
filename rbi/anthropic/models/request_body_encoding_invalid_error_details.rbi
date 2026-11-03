# typed: strong

module Anthropic
  module Models
    class RequestBodyEncodingInvalidErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RequestBodyEncodingInvalidErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request body is not valid for its `Content-Encoding`.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :request_body_encoding_invalid)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

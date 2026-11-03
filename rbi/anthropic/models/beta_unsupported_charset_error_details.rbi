# typed: strong

module Anthropic
  module Models
    class BetaUnsupportedCharsetErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaUnsupportedCharsetErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request's `Content-Type` header names a charset other than UTF-8, ISO-8859-1
      # or US-ASCII. Send the request with no charset, or with one of these.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :unsupported_charset)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

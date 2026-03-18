# typed: strong

module Anthropic
  module Models
    module ErrorType
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::ErrorType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVALID_REQUEST_ERROR =
        T.let(:invalid_request_error, Anthropic::ErrorType::TaggedSymbol)
      AUTHENTICATION_ERROR =
        T.let(:authentication_error, Anthropic::ErrorType::TaggedSymbol)
      PERMISSION_ERROR =
        T.let(:permission_error, Anthropic::ErrorType::TaggedSymbol)
      NOT_FOUND_ERROR =
        T.let(:not_found_error, Anthropic::ErrorType::TaggedSymbol)
      RATE_LIMIT_ERROR =
        T.let(:rate_limit_error, Anthropic::ErrorType::TaggedSymbol)
      TIMEOUT_ERROR = T.let(:timeout_error, Anthropic::ErrorType::TaggedSymbol)
      OVERLOADED_ERROR =
        T.let(:overloaded_error, Anthropic::ErrorType::TaggedSymbol)
      API_ERROR = T.let(:api_error, Anthropic::ErrorType::TaggedSymbol)
      BILLING_ERROR = T.let(:billing_error, Anthropic::ErrorType::TaggedSymbol)

      sig { override.returns(T::Array[Anthropic::ErrorType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    class ModelRetrieveParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::ModelRetrieveParams, Anthropic::Internal::AnyHash)
        end

      # Optional header to specify the beta version(s) you want to use.
      sig { returns(T.nilable(T::Array[Anthropic::AnthropicBeta::Variants])) }
      attr_reader :betas

      sig { params(betas: T::Array[Anthropic::AnthropicBeta::Variants]).void }
      attr_writer :betas

      sig do
        params(
          betas: T::Array[Anthropic::AnthropicBeta::Variants],
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Optional header to specify the beta version(s) you want to use.
        betas: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            betas: T::Array[Anthropic::AnthropicBeta::Variants],
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

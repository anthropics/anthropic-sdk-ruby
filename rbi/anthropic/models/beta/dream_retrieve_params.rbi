# typed: strong

module Anthropic
  module Models
    module Beta
      class DreamRetrieveParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::DreamRetrieveParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :dream_id

        # Optional header to specify the beta version(s) you want to use.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
          ).void
        end
        attr_writer :betas

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig do
          params(
            dream_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          dream_id:,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              dream_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
end

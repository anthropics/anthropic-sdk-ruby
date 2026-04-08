# typed: strong

module Anthropic
  module Models
    module Beta
      class VaultCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::VaultCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable name for the vault. 1-255 characters.
        sig { returns(String) }
        attr_accessor :display_name

        # Arbitrary key-value metadata to attach to the vault. Maximum 16 pairs, keys up
        # to 64 chars, values up to 512 chars.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

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

        sig do
          params(
            display_name: String,
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable name for the vault. 1-255 characters.
          display_name:,
          # Arbitrary key-value metadata to attach to the vault. Maximum 16 pairs, keys up
          # to 64 chars, values up to 512 chars.
          metadata: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              display_name: String,
              metadata: T::Hash[Symbol, String],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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

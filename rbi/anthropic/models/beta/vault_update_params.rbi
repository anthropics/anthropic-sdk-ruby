# typed: strong

module Anthropic
  module Models
    module Beta
      class VaultUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::VaultUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :vault_id

        # Updated human-readable name for the vault. 1-255 characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :display_name

        # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        # Omitted keys are preserved.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :metadata

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
            vault_id: String,
            display_name: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          vault_id:,
          # Updated human-readable name for the vault. 1-255 characters.
          display_name: nil,
          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omitted keys are preserved.
          metadata: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              vault_id: String,
              display_name: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
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

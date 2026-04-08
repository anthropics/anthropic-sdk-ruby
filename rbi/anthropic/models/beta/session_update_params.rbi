# typed: strong

module Anthropic
  module Models
    module Beta
      class SessionUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::SessionUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :session_id

        # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        # Omit the field to preserve.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :metadata

        # Human-readable session title.
        sig { returns(T.nilable(String)) }
        attr_accessor :title

        # Vault IDs (`vlt_*`) to attach to the session. Not yet supported; requests
        # setting this field are rejected. Reserved for future use.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :vault_ids

        sig { params(vault_ids: T::Array[String]).void }
        attr_writer :vault_ids

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
            session_id: String,
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            title: T.nilable(String),
            vault_ids: T::Array[String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          session_id:,
          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omit the field to preserve.
          metadata: nil,
          # Human-readable session title.
          title: nil,
          # Vault IDs (`vlt_*`) to attach to the session. Not yet supported; requests
          # setting this field are rejected. Reserved for future use.
          vault_ids: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              session_id: String,
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              title: T.nilable(String),
              vault_ids: T::Array[String],
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

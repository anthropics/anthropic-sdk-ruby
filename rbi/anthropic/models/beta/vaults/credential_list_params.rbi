# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class CredentialListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::CredentialListParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :vault_id

          # Whether to include archived credentials in the results.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :include_archived

          sig { params(include_archived: T::Boolean).void }
          attr_writer :include_archived

          # Maximum number of credentials to return per page. Defaults to 20, maximum 100.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque pagination token from a previous `list_credentials` response.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

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
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            vault_id:,
            # Whether to include archived credentials in the results.
            include_archived: nil,
            # Maximum number of credentials to return per page. Defaults to 20, maximum 100.
            limit: nil,
            # Opaque pagination token from a previous `list_credentials` response.
            page: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                vault_id: String,
                include_archived: T::Boolean,
                limit: Integer,
                page: String,
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
end

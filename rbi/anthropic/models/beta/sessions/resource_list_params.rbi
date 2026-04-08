# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class ResourceListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::ResourceListParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :session_id

          # Maximum number of resources to return per page (max 1000). If omitted, returns
          # all resources.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque cursor from a previous response's next_page field.
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
              session_id: String,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            session_id:,
            # Maximum number of resources to return per page (max 1000). If omitted, returns
            # all resources.
            limit: nil,
            # Opaque cursor from a previous response's next_page field.
            page: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                session_id: String,
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

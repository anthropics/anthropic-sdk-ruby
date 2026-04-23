# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryDeleteParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryDeleteParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :memory_store_id

          sig { returns(String) }
          attr_accessor :memory_id

          # Query parameter for expected_content_sha256
          sig { returns(T.nilable(String)) }
          attr_reader :expected_content_sha256

          sig { params(expected_content_sha256: String).void }
          attr_writer :expected_content_sha256

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
              memory_store_id: String,
              memory_id: String,
              expected_content_sha256: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            memory_store_id:,
            memory_id:,
            # Query parameter for expected_content_sha256
            expected_content_sha256: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                memory_store_id: String,
                memory_id: String,
                expected_content_sha256: String,
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

# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryVersionListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryVersionListParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :memory_store_id

          # Query parameter for api_key_id
          sig { returns(T.nilable(String)) }
          attr_reader :api_key_id

          sig { params(api_key_id: String).void }
          attr_writer :api_key_id

          # Return versions created at or after this time (inclusive).
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_gte

          sig { params(created_at_gte: Time).void }
          attr_writer :created_at_gte

          # Return versions created at or before this time (inclusive).
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_lte

          sig { params(created_at_lte: Time).void }
          attr_writer :created_at_lte

          # Query parameter for limit
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Query parameter for memory_id
          sig { returns(T.nilable(String)) }
          attr_reader :memory_id

          sig { params(memory_id: String).void }
          attr_writer :memory_id

          # Query parameter for operation
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol
              )
            )
          end
          attr_reader :operation

          sig do
            params(
              operation:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol
            ).void
          end
          attr_writer :operation

          # Query parameter for page
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # Query parameter for session_id
          sig { returns(T.nilable(String)) }
          attr_reader :session_id

          sig { params(session_id: String).void }
          attr_writer :session_id

          # Query parameter for view
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol
              )
            )
          end
          attr_reader :view

          sig do
            params(
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol
            ).void
          end
          attr_writer :view

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
              api_key_id: String,
              created_at_gte: Time,
              created_at_lte: Time,
              limit: Integer,
              memory_id: String,
              operation:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol,
              page: String,
              session_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            memory_store_id:,
            # Query parameter for api_key_id
            api_key_id: nil,
            # Return versions created at or after this time (inclusive).
            created_at_gte: nil,
            # Return versions created at or before this time (inclusive).
            created_at_lte: nil,
            # Query parameter for limit
            limit: nil,
            # Query parameter for memory_id
            memory_id: nil,
            # Query parameter for operation
            operation: nil,
            # Query parameter for page
            page: nil,
            # Query parameter for session_id
            session_id: nil,
            # Query parameter for view
            view: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                memory_store_id: String,
                api_key_id: String,
                created_at_gte: Time,
                created_at_lte: Time,
                limit: Integer,
                memory_id: String,
                operation:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol,
                page: String,
                session_id: String,
                view:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
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

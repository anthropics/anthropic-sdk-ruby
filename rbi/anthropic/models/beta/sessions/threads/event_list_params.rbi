# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        module Threads
          class EventListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::Threads::EventListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :session_id

            sig { returns(String) }
            attr_accessor :thread_id

            # Query parameter for limit
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Query parameter for page
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
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                session_id: String,
                thread_id: String,
                limit: Integer,
                page: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              session_id:,
              thread_id:,
              # Query parameter for limit
              limit: nil,
              # Query parameter for page
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
                  thread_id: String,
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
end

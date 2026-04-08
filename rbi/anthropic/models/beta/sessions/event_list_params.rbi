# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class EventListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::EventListParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :session_id

          # Query parameter for limit
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Sort direction for results, ordered by created_at. Defaults to asc
          # (chronological).
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::EventListParams::Order::OrSymbol
              )
            )
          end
          attr_reader :order

          sig do
            params(
              order: Anthropic::Beta::Sessions::EventListParams::Order::OrSymbol
            ).void
          end
          attr_writer :order

          # Opaque pagination cursor from a previous response's next_page.
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
              order:
                Anthropic::Beta::Sessions::EventListParams::Order::OrSymbol,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            session_id:,
            # Query parameter for limit
            limit: nil,
            # Sort direction for results, ordered by created_at. Defaults to asc
            # (chronological).
            order: nil,
            # Opaque pagination cursor from a previous response's next_page.
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
                order:
                  Anthropic::Beta::Sessions::EventListParams::Order::OrSymbol,
                page: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Sort direction for results, ordered by created_at. Defaults to asc
          # (chronological).
          module Order
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Anthropic::Beta::Sessions::EventListParams::Order)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ASC =
              T.let(
                :asc,
                Anthropic::Beta::Sessions::EventListParams::Order::TaggedSymbol
              )
            DESC =
              T.let(
                :desc,
                Anthropic::Beta::Sessions::EventListParams::Order::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::EventListParams::Order::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end

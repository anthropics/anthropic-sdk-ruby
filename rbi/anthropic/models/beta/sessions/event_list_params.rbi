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

          # Return events created after this time (exclusive).
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_gt

          sig { params(created_at_gt: Time).void }
          attr_writer :created_at_gt

          # Return events created at or after this time (inclusive).
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_gte

          sig { params(created_at_gte: Time).void }
          attr_writer :created_at_gte

          # Return events created before this time (exclusive).
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_lt

          sig { params(created_at_lt: Time).void }
          attr_writer :created_at_lt

          # Return events created at or before this time (inclusive).
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_lte

          sig { params(created_at_lte: Time).void }
          attr_writer :created_at_lte

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

          # Filter by event type. Values match the `type` field on returned events (for
          # example, `user.message` or `agent.tool_use`). Omit to return all event types.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :types

          sig { params(types: T::Array[String]).void }
          attr_writer :types

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
              created_at_gt: Time,
              created_at_gte: Time,
              created_at_lt: Time,
              created_at_lte: Time,
              limit: Integer,
              order:
                Anthropic::Beta::Sessions::EventListParams::Order::OrSymbol,
              page: String,
              types: T::Array[String],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            session_id:,
            # Return events created after this time (exclusive).
            created_at_gt: nil,
            # Return events created at or after this time (inclusive).
            created_at_gte: nil,
            # Return events created before this time (exclusive).
            created_at_lt: nil,
            # Return events created at or before this time (inclusive).
            created_at_lte: nil,
            # Query parameter for limit
            limit: nil,
            # Sort direction for results, ordered by created_at. Defaults to asc
            # (chronological).
            order: nil,
            # Opaque pagination cursor from a previous response's next_page.
            page: nil,
            # Filter by event type. Values match the `type` field on returned events (for
            # example, `user.message` or `agent.tool_use`). Omit to return all event types.
            types: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                session_id: String,
                created_at_gt: Time,
                created_at_gte: Time,
                created_at_lt: Time,
                created_at_lte: Time,
                limit: Integer,
                order:
                  Anthropic::Beta::Sessions::EventListParams::Order::OrSymbol,
                page: String,
                types: T::Array[String],
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

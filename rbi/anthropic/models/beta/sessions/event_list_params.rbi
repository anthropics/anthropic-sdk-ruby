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

          # Return events created after this time (exclusive). Compared against the event's
          # `processed_at` value.
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_gt

          sig { params(created_at_gt: Time).void }
          attr_writer :created_at_gt

          # Return events created at or after this time (inclusive). Compared against the
          # event's `processed_at` value.
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_gte

          sig { params(created_at_gte: Time).void }
          attr_writer :created_at_gte

          # Return events created before this time (exclusive). Compared against the event's
          # `processed_at` value.
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_lt

          sig { params(created_at_lt: Time).void }
          attr_writer :created_at_lt

          # Return events created at or before this time (inclusive). Compared against the
          # event's `processed_at` value.
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_lte

          sig { params(created_at_lte: Time).void }
          attr_writer :created_at_lte

          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Sort direction for results, ordered by the event's `processed_at`. Defaults to
          # `asc` (chronological).
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

          # Opaque pagination cursor from a previous response's `next_page`.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # Filter by event type. Values match the `type` field on returned events (for
          # example, `user.message` or `agent.tool_use`). Omit to return all event types.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::OrSymbol
                ]
              )
            )
          end
          attr_reader :types

          sig do
            params(
              types:
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::OrSymbol
                ]
            ).void
          end
          attr_writer :types

          # Optional header to specify the beta version(s) you want to use.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          sig { returns(T.nilable(String)) }
          attr_reader :workspace_id

          sig { params(workspace_id: String).void }
          attr_writer :workspace_id

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
              types:
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::OrSymbol
                ],
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            session_id:,
            # Return events created after this time (exclusive). Compared against the event's
            # `processed_at` value.
            created_at_gt: nil,
            # Return events created at or after this time (inclusive). Compared against the
            # event's `processed_at` value.
            created_at_gte: nil,
            # Return events created before this time (exclusive). Compared against the event's
            # `processed_at` value.
            created_at_lt: nil,
            # Return events created at or before this time (inclusive). Compared against the
            # event's `processed_at` value.
            created_at_lte: nil,
            limit: nil,
            # Sort direction for results, ordered by the event's `processed_at`. Defaults to
            # `asc` (chronological).
            order: nil,
            # Opaque pagination cursor from a previous response's `next_page`.
            page: nil,
            # Filter by event type. Values match the `type` field on returned events (for
            # example, `user.message` or `agent.tool_use`). Omit to return all event types.
            types: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            # Optional header to select the Workspace for this request. The value is a
            # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
            #
            # Only needed for credentials that can act on more than one Workspace. A
            # credential that belongs to a specific Workspace may omit it; if sent, it must
            # match that Workspace.
            workspace_id: nil,
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
                types:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionEventType::OrSymbol
                  ],
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                workspace_id: String,
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Sort direction for results, ordered by the event's `processed_at`. Defaults to
          # `asc` (chronological).
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

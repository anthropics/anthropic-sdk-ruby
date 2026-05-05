# typed: strong

module Anthropic
  module Models
    module Beta
      class SessionListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::SessionListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Filter sessions created with this agent ID.
        sig { returns(T.nilable(String)) }
        attr_reader :agent_id

        sig { params(agent_id: String).void }
        attr_writer :agent_id

        # Filter by agent version. Only applies when agent_id is also set.
        sig { returns(T.nilable(Integer)) }
        attr_reader :agent_version

        sig { params(agent_version: Integer).void }
        attr_writer :agent_version

        # Return sessions created after this time (exclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gt

        sig { params(created_at_gt: Time).void }
        attr_writer :created_at_gt

        # Return sessions created at or after this time (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gte

        sig { params(created_at_gte: Time).void }
        attr_writer :created_at_gte

        # Return sessions created before this time (exclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lt

        sig { params(created_at_lt: Time).void }
        attr_writer :created_at_lt

        # Return sessions created at or before this time (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lte

        sig { params(created_at_lte: Time).void }
        attr_writer :created_at_lte

        # When true, includes archived sessions. Default: false (exclude archived).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_archived

        sig { params(include_archived: T::Boolean).void }
        attr_writer :include_archived

        # Maximum number of results to return.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Filter sessions whose resources contain a memory_store with this memory store
        # ID.
        sig { returns(T.nilable(String)) }
        attr_reader :memory_store_id

        sig { params(memory_store_id: String).void }
        attr_writer :memory_store_id

        # Sort direction for results, ordered by created_at. Defaults to desc (newest
        # first).
        sig do
          returns(
            T.nilable(Anthropic::Beta::SessionListParams::Order::OrSymbol)
          )
        end
        attr_reader :order

        sig do
          params(
            order: Anthropic::Beta::SessionListParams::Order::OrSymbol
          ).void
        end
        attr_writer :order

        # Opaque pagination cursor from a previous response's next_page.
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

        # Filter by session status. Repeat the parameter to match any of multiple
        # statuses.
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::SessionListParams::Status::OrSymbol]
            )
          )
        end
        attr_reader :statuses

        sig do
          params(
            statuses:
              T::Array[Anthropic::Beta::SessionListParams::Status::OrSymbol]
          ).void
        end
        attr_writer :statuses

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
            agent_id: String,
            agent_version: Integer,
            created_at_gt: Time,
            created_at_gte: Time,
            created_at_lt: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            memory_store_id: String,
            order: Anthropic::Beta::SessionListParams::Order::OrSymbol,
            page: String,
            statuses:
              T::Array[Anthropic::Beta::SessionListParams::Status::OrSymbol],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter sessions created with this agent ID.
          agent_id: nil,
          # Filter by agent version. Only applies when agent_id is also set.
          agent_version: nil,
          # Return sessions created after this time (exclusive).
          created_at_gt: nil,
          # Return sessions created at or after this time (inclusive).
          created_at_gte: nil,
          # Return sessions created before this time (exclusive).
          created_at_lt: nil,
          # Return sessions created at or before this time (inclusive).
          created_at_lte: nil,
          # When true, includes archived sessions. Default: false (exclude archived).
          include_archived: nil,
          # Maximum number of results to return.
          limit: nil,
          # Filter sessions whose resources contain a memory_store with this memory store
          # ID.
          memory_store_id: nil,
          # Sort direction for results, ordered by created_at. Defaults to desc (newest
          # first).
          order: nil,
          # Opaque pagination cursor from a previous response's next_page.
          page: nil,
          # Filter by session status. Repeat the parameter to match any of multiple
          # statuses.
          statuses: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              agent_id: String,
              agent_version: Integer,
              created_at_gt: Time,
              created_at_gte: Time,
              created_at_lt: Time,
              created_at_lte: Time,
              include_archived: T::Boolean,
              limit: Integer,
              memory_store_id: String,
              order: Anthropic::Beta::SessionListParams::Order::OrSymbol,
              page: String,
              statuses:
                T::Array[Anthropic::Beta::SessionListParams::Status::OrSymbol],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Sort direction for results, ordered by created_at. Defaults to desc (newest
        # first).
        module Order
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::SessionListParams::Order)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ASC =
            T.let(:asc, Anthropic::Beta::SessionListParams::Order::TaggedSymbol)
          DESC =
            T.let(
              :desc,
              Anthropic::Beta::SessionListParams::Order::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::SessionListParams::Order::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        # SessionStatus enum
        module Status
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::SessionListParams::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RESCHEDULING =
            T.let(
              :rescheduling,
              Anthropic::Beta::SessionListParams::Status::TaggedSymbol
            )
          RUNNING =
            T.let(
              :running,
              Anthropic::Beta::SessionListParams::Status::TaggedSymbol
            )
          IDLE =
            T.let(
              :idle,
              Anthropic::Beta::SessionListParams::Status::TaggedSymbol
            )
          TERMINATED =
            T.let(
              :terminated,
              Anthropic::Beta::SessionListParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::SessionListParams::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

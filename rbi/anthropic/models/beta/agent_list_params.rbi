# typed: strong

module Anthropic
  module Models
    module Beta
      class AgentListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::AgentListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Return agents created at or after this time (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gte

        sig { params(created_at_gte: Time).void }
        attr_writer :created_at_gte

        # Return agents created at or before this time (inclusive).
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lte

        sig { params(created_at_lte: Time).void }
        attr_writer :created_at_lte

        # Include archived agents in results. Defaults to false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_archived

        sig { params(include_archived: T::Boolean).void }
        attr_writer :include_archived

        # Maximum results per page. Default 20, maximum 100.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Opaque pagination cursor from a previous response.
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

        # This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
        # header.
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
            created_at_gte: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Return agents created at or after this time (inclusive).
          created_at_gte: nil,
          # Return agents created at or before this time (inclusive).
          created_at_lte: nil,
          # Include archived agents in results. Defaults to false.
          include_archived: nil,
          # Maximum results per page. Default 20, maximum 100.
          limit: nil,
          # Opaque pagination cursor from a previous response.
          page: nil,
          # This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
          # header.
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
              created_at_gte: Time,
              created_at_lte: Time,
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
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

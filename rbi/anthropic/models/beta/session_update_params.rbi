# typed: strong

module Anthropic
  module Models
    module Beta
      class SessionUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::SessionUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :session_id

        # Agent configuration update. Only `tools` and `mcp_servers` are updatable
        # mid-session. Only valid for sessions created from an agent or deployment
        # reference. The session must not be running.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate)
          )
        end
        attr_reader :agent

        sig do
          params(
            agent: Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::OrHash
          ).void
        end
        attr_writer :agent

        # Enforced spend ceiling for the session. Set an object to replace the budget of a
        # session that was created with one, or `null` to remove it; omit to preserve. A
        # budget cannot be added to a session created without one (rejected with reason
        # `budget_create_only`), and a removed budget cannot be re-added. Allowed in any
        # non-terminated status. Lowering `max_list_cost` to at or below the session's
        # consumed list cost is rejected with reason `budget_not_raised`, and every model
        # the session can run must have a public list price or the request is rejected
        # with reason `model_not_budgetable`.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit))
        end
        attr_reader :budget

        sig do
          params(
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash)
          ).void
        end
        attr_writer :budget

        # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        # Omit the field to preserve.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :metadata

        # Human-readable session title.
        sig { returns(T.nilable(String)) }
        attr_accessor :title

        # Vault IDs (`vlt_*`) to attach to the session. Not yet supported; requests
        # setting this field are rejected. Reserved for future use.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :vault_ids

        sig { params(vault_ids: T::Array[String]).void }
        attr_writer :vault_ids

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
            agent: Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::OrHash,
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            title: T.nilable(String),
            vault_ids: T::Array[String],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          session_id:,
          # Agent configuration update. Only `tools` and `mcp_servers` are updatable
          # mid-session. Only valid for sessions created from an agent or deployment
          # reference. The session must not be running.
          agent: nil,
          # Enforced spend ceiling for the session. Set an object to replace the budget of a
          # session that was created with one, or `null` to remove it; omit to preserve. A
          # budget cannot be added to a session created without one (rejected with reason
          # `budget_create_only`), and a removed budget cannot be re-added. Allowed in any
          # non-terminated status. Lowering `max_list_cost` to at or below the session's
          # consumed list cost is rejected with reason `budget_not_raised`, and every model
          # the session can run must have a public list price or the request is rejected
          # with reason `model_not_budgetable`.
          budget: nil,
          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omit the field to preserve.
          metadata: nil,
          # Human-readable session title.
          title: nil,
          # Vault IDs (`vlt_*`) to attach to the session. Not yet supported; requests
          # setting this field are rejected. Reserved for future use.
          vault_ids: nil,
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
              agent: Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate,
              budget: T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              title: T.nilable(String),
              vault_ids: T::Array[String],
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

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

        # Mid-session agent configuration update. Only `tools` and `mcp_servers` are
        # updatable. Full replacement: the provided array becomes the new value. To
        # preserve existing entries, GET the session, modify the array, and POST it back.
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

        # A hard spend ceiling. The session stops issuing new model requests once the
        # tracked list cost reaches `max_list_cost`.
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
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          session_id:,
          # Mid-session agent configuration update. Only `tools` and `mcp_servers` are
          # updatable. Full replacement: the provided array becomes the new value. To
          # preserve existing entries, GET the session, modify the array, and POST it back.
          agent: nil,
          # A hard spend ceiling. The session stops issuing new model requests once the
          # tracked list cost reaches `max_list_cost`.
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
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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

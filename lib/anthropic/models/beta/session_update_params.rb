# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Sessions#update
      class SessionUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute session_id
        #
        #   @return [String]
        required :session_id, String

        # @!attribute agent
        #   Agent configuration update. Only `tools` and `mcp_servers` are updatable
        #   mid-session. Only valid for sessions created from an agent or deployment
        #   reference. The session must not be running.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsSessionAgentUpdate, nil]
        optional :agent, -> { Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate }

        # @!attribute budget
        #   Enforced spend ceiling for the session. Set an object to replace the budget of a
        #   session that was created with one, or `null` to remove it; omit to preserve. A
        #   budget cannot be added to a session created without one (rejected with reason
        #   `budget_create_only`), and a removed budget cannot be re-added. Allowed in any
        #   non-terminated status. Lowering `max_list_cost` to at or below the session's
        #   consumed list cost is rejected with reason `budget_not_raised`, and every model
        #   the session can run must have a public list price or the request is rejected
        #   with reason `model_not_budgetable`.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil]
        optional :budget, -> { Anthropic::Beta::BetaManagedAgentsBudgetLimit }, nil?: true

        # @!attribute metadata
        #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        #   Omit the field to preserve.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute title
        #   Human-readable session title.
        #
        #   @return [String, nil]
        optional :title, String, nil?: true

        # @!attribute vault_ids
        #   Vault IDs (`vlt_*`) to attach to the session. Not yet supported; requests
        #   setting this field are rejected. Reserved for future use.
        #
        #   @return [Array<String>, nil]
        optional :vault_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!attribute workspace_id
        #   Optional header to select the Workspace for this request. The value is a
        #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        #   Only needed for credentials that can act on more than one Workspace. A
        #   credential that belongs to a specific Workspace may omit it; if sent, it must
        #   match that Workspace.
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!method initialize(session_id:, agent: nil, budget: nil, metadata: nil, title: nil, vault_ids: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::SessionUpdateParams} for more details.
        #
        #   @param session_id [String]
        #
        #   @param agent [Anthropic::Models::Beta::BetaManagedAgentsSessionAgentUpdate] Agent configuration update. Only `tools` and `mcp_servers` are updatable mid-ses
        #
        #   @param budget [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil] Enforced spend ceiling for the session. Set an object to replace the budget of a
        #
        #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
        #
        #   @param title [String, nil] Human-readable session title.
        #
        #   @param vault_ids [Array<String>] Vault IDs (`vlt_*`) to attach to the session. Not yet supported; requests settin
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

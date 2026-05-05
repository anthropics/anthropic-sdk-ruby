# typed: strong

module Anthropic
  module Resources
    class Beta
      class Agents
        sig { returns(Anthropic::Resources::Beta::Agents::Versions) }
        attr_reader :versions

        # Create Agent
        sig do
          params(
            model:
              T.any(
                Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                String,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::OrHash
              ),
            name: String,
            description: T.nilable(String),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
              ],
            metadata: T::Hash[Symbol, String],
            multiagent:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMultiagentParams::OrHash
              ),
            skills:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomSkillParams::OrHash
                )
              ],
            system_: T.nilable(String),
            tools:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomToolParams::OrHash
                )
              ],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsAgent)
        end
        def create(
          # Body param: Model identifier. Accepts the
          # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
          # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
          # control
          model:,
          # Body param: Human-readable name for the agent. 1-256 characters.
          name:,
          # Body param: Description of what the agent does. Up to 2048 characters.
          description: nil,
          # Body param: MCP servers this agent connects to. Maximum 20. Names must be unique
          # within the array.
          mcp_servers: nil,
          # Body param: Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars,
          # values up to 512 chars.
          metadata: nil,
          # Body param: A coordinator topology: the session's primary thread orchestrates
          # work by spawning session threads, each running an agent drawn from the `agents`
          # roster.
          multiagent: nil,
          # Body param: Skills available to the agent. Maximum 20.
          skills: nil,
          # Body param: System prompt for the agent. Up to 100,000 characters.
          system_: nil,
          # Body param: Tool configurations available to the agent. Maximum of 128 tools
          # across all toolsets allowed.
          tools: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Get Agent
        sig do
          params(
            agent_id: String,
            version: Integer,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsAgent)
        end
        def retrieve(
          # Path param: Path parameter agent_id
          agent_id,
          # Query param: Agent version. Omit for the most recent version. Must be at least 1
          # if specified.
          version: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Update Agent
        sig do
          params(
            agent_id: String,
            version: Integer,
            description: T.nilable(String),
            mcp_servers:
              T.nilable(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
                ]
              ),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            model:
              T.any(
                Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                String,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::OrHash
              ),
            multiagent:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMultiagentParams::OrHash
              ),
            name: String,
            skills:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCustomSkillParams::OrHash
                  )
                ]
              ),
            system_: T.nilable(String),
            tools:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::OrHash,
                    Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCustomToolParams::OrHash
                  )
                ]
              ),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsAgent)
        end
        def update(
          # Path param: Path parameter agent_id
          agent_id,
          # Body param: The agent's current version, used to prevent concurrent overwrites.
          # Obtain this value from a create or retrieve response. The request fails if this
          # does not match the server's current version.
          version:,
          # Body param: Description. Up to 2048 characters. Omit to preserve; send empty
          # string or null to clear.
          description: nil,
          # Body param: MCP servers. Full replacement. Omit to preserve; send empty array or
          # null to clear. Names must be unique. Maximum 20.
          mcp_servers: nil,
          # Body param: Metadata patch. Set a key to a string to upsert it, or to null to
          # delete it. Omit the field to preserve. The stored bag is limited to 16 keys (up
          # to 64 chars each) with values up to 512 chars.
          metadata: nil,
          # Body param: Model identifier. Accepts the
          # [model string](https://platform.claude.com/docs/en/about-claude/models/overview#latest-models-comparison),
          # e.g. `claude-opus-4-6`, or a `model_config` object for additional configuration
          # control. Omit to preserve. Cannot be cleared.
          model: nil,
          # Body param: A coordinator topology: the session's primary thread orchestrates
          # work by spawning session threads, each running an agent drawn from the `agents`
          # roster.
          multiagent: nil,
          # Body param: Human-readable name. 1-256 characters. Omit to preserve. Cannot be
          # cleared.
          name: nil,
          # Body param: Skills. Full replacement. Omit to preserve; send empty array or null
          # to clear. Maximum 20.
          skills: nil,
          # Body param: System prompt. Up to 100,000 characters. Omit to preserve; send
          # empty string or null to clear.
          system_: nil,
          # Body param: Tool configurations available to the agent. Full replacement. Omit
          # to preserve; send empty array or null to clear. Maximum of 128 tools across all
          # toolsets allowed.
          tools: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List Agents
        sig do
          params(
            created_at_gte: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[
              Anthropic::Beta::BetaManagedAgentsAgent
            ]
          )
        end
        def list(
          # Query param: Return agents created at or after this time (inclusive).
          created_at_gte: nil,
          # Query param: Return agents created at or before this time (inclusive).
          created_at_lte: nil,
          # Query param: Include archived agents in results. Defaults to false.
          include_archived: nil,
          # Query param: Maximum results per page. Default 20, maximum 100.
          limit: nil,
          # Query param: Opaque pagination cursor from a previous response.
          page: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Archive Agent
        sig do
          params(
            agent_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsAgent)
        end
        def archive(
          # Path parameter agent_id
          agent_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end

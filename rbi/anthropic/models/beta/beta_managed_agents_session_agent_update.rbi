# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionAgentUpdate =
      Beta::BetaManagedAgentsSessionAgentUpdate

    module Beta
      class BetaManagedAgentsSessionAgentUpdate < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate,
              Anthropic::Internal::AnyHash
            )
          end

        # Replacement MCP server list. Full replacement: the provided array becomes the
        # new value. Send an empty array to clear; omit to preserve.
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams]
            )
          )
        end
        attr_reader :mcp_servers

        sig do
          params(
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
              ]
          ).void
        end
        attr_writer :mcp_servers

        # Replacement tool list. Full replacement: the provided array becomes the new
        # value. Send an empty array to clear; omit to preserve.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
                  Anthropic::Beta::BetaManagedAgentsCustomToolParams
                )
              ]
            )
          )
        end
        attr_reader :tools

        sig do
          params(
            tools:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomToolParams::OrHash
                )
              ]
          ).void
        end
        attr_writer :tools

        # Mid-session agent configuration update. Only `tools` and `mcp_servers` are
        # updatable. Full replacement: the provided array becomes the new value. To
        # preserve existing entries, GET the session, modify the array, and POST it back.
        sig do
          params(
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::OrHash
              ],
            tools:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsCustomToolParams::OrHash
                )
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Replacement MCP server list. Full replacement: the provided array becomes the
          # new value. Send an empty array to clear; omit to preserve.
          mcp_servers: nil,
          # Replacement tool list. Full replacement: the provided array becomes the new
          # value. Send an empty array to clear; omit to preserve.
          tools: nil
        )
        end

        sig do
          override.returns(
            {
              mcp_servers:
                T::Array[Anthropic::Beta::BetaManagedAgentsURLMCPServerParams],
              tools:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
                    Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
                    Anthropic::Beta::BetaManagedAgentsCustomToolParams
                  )
                ]
            }
          )
        end
        def to_hash
        end

        # Union type for tool configurations in the tools array.
        module Tool
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
                Anthropic::Beta::BetaManagedAgentsMCPToolsetParams,
                Anthropic::Beta::BetaManagedAgentsCustomToolParams
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionAgentUpdate::Tool::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end

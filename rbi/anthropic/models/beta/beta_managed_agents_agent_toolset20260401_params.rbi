# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolset20260401Params =
      Beta::BetaManagedAgentsAgentToolset20260401Params

    module Beta
      class BetaManagedAgentsAgentToolset20260401Params < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Per-tool configuration overrides.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsBashToolConfigParams,
                  Anthropic::Beta::BetaManagedAgentsEditToolConfigParams,
                  Anthropic::Beta::BetaManagedAgentsReadToolConfigParams,
                  Anthropic::Beta::BetaManagedAgentsWriteToolConfigParams,
                  Anthropic::Beta::BetaManagedAgentsGlobToolConfigParams,
                  Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams,
                  Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams,
                  Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams
                )
              ]
            )
          )
        end
        attr_reader :configs

        sig do
          params(
            configs:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsBashToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsEditToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsReadToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWriteToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsGlobToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::OrHash
                )
              ]
          ).void
        end
        attr_writer :configs

        # Default configuration applied to all tools in this set.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams
            )
          )
        end
        attr_reader :default_config

        sig do
          params(
            default_config:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams::OrHash
              )
          ).void
        end
        attr_writer :default_config

        # Configuration for built-in agent tools. Use this to enable or disable groups of
        # tools available to the agent.
        sig do
          params(
            configs:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsBashToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsEditToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsReadToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWriteToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsGlobToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams::OrHash
                )
              ],
            default_config:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Per-tool configuration overrides.
          configs: nil,
          # Default configuration applied to all tools in this set.
          default_config: nil,
          type: :agent_toolset_20260401
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              configs:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsBashToolConfigParams,
                    Anthropic::Beta::BetaManagedAgentsEditToolConfigParams,
                    Anthropic::Beta::BetaManagedAgentsReadToolConfigParams,
                    Anthropic::Beta::BetaManagedAgentsWriteToolConfigParams,
                    Anthropic::Beta::BetaManagedAgentsGlobToolConfigParams,
                    Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams,
                    Anthropic::Beta::BetaManagedAgentsWebFetchToolConfigParams,
                    Anthropic::Beta::BetaManagedAgentsWebSearchToolConfigParams
                  )
                ],
              default_config:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams
                )
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

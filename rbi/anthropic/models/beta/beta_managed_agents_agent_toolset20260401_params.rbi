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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Per-tool configuration overrides.
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams]
            )
          )
        end
        attr_reader :configs

        sig do
          params(
            configs:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::OrHash
              ]
          ).void
        end
        attr_writer :configs

        # Default configuration for all tools in a toolset.
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
            type:
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::Type::OrSymbol,
            configs:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::OrHash
              ],
            default_config:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          type:,
          # Per-tool configuration overrides.
          configs: nil,
          # Default configuration for all tools in a toolset.
          default_config: nil
        )
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::Type::OrSymbol,
              configs:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams
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

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_TOOLSET_20260401 =
            T.let(
              :agent_toolset_20260401,
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::Type::TaggedSymbol
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

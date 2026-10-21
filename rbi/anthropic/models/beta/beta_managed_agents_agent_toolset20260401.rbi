# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolset20260401 =
      Beta::BetaManagedAgentsAgentToolset20260401

    module Beta
      class BetaManagedAgentsAgentToolset20260401 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Variants
            ]
          )
        end
        attr_accessor :configs

        # Resolved default configuration for agent tools.
        sig do
          returns(Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig)
        end
        attr_reader :default_config

        sig do
          params(
            default_config:
              Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig::OrHash
          ).void
        end
        attr_writer :default_config

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            configs:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsBashToolConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsEditToolConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsReadToolConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWriteToolConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsGlobToolConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsGrepToolConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchToolConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebSearchToolConfig::OrHash
                )
              ],
            default_config:
              Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          configs:,
          # Resolved default configuration for agent tools.
          default_config:,
          type: :agent_toolset_20260401
        )
        end

        sig do
          override.returns(
            {
              configs:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Variants
                ],
              default_config:
                Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

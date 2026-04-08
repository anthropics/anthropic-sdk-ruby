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
          returns(T::Array[Anthropic::Beta::BetaManagedAgentsAgentToolConfig])
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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            configs:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolConfig::OrHash
              ],
            default_config:
              Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig::OrHash,
            type:
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          configs:,
          # Resolved default configuration for agent tools.
          default_config:,
          type:
        )
        end

        sig do
          override.returns(
            {
              configs:
                T::Array[Anthropic::Beta::BetaManagedAgentsAgentToolConfig],
              default_config:
                Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig,
              type:
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_TOOLSET_20260401 =
            T.let(
              :agent_toolset_20260401,
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::Type::TaggedSymbol
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

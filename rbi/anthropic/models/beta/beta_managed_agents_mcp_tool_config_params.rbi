# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMCPToolConfigParams =
      Beta::BetaManagedAgentsMCPToolConfigParams

    module Beta
      class BetaManagedAgentsMCPToolConfigParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Name of the MCP tool to configure. 1-128 characters.
        sig { returns(String) }
        attr_accessor :name

        # Whether this tool is enabled. Overrides the `default_config` setting.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :enabled

        # Permission policy for tool execution.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy
              )
            )
          )
        end
        attr_accessor :permission_policy

        # Configuration override for a specific MCP tool.
        sig do
          params(
            name: String,
            enabled: T.nilable(T::Boolean),
            permission_policy:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
                )
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Name of the MCP tool to configure. 1-128 characters.
          name:,
          # Whether this tool is enabled. Overrides the `default_config` setting.
          enabled: nil,
          # Permission policy for tool execution.
          permission_policy: nil
        )
        end

        sig do
          override.returns(
            {
              name: String,
              enabled: T.nilable(T::Boolean),
              permission_policy:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
                    Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy
                  )
                )
            }
          )
        end
        def to_hash
        end

        # Permission policy for tool execution.
        module PermissionPolicy
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams::PermissionPolicy::Variants
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

# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMCPToolConfig = Beta::BetaManagedAgentsMCPToolConfig

    module Beta
      class BetaManagedAgentsMCPToolConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMCPToolConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :enabled

        sig { returns(String) }
        attr_accessor :name

        # Permission policy for tool execution.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMCPToolConfig::PermissionPolicy::Variants
          )
        end
        attr_accessor :permission_policy

        # Resolved configuration for a specific MCP tool.
        sig do
          params(
            enabled: T::Boolean,
            name: String,
            permission_policy:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          enabled:,
          name:,
          # Permission policy for tool execution.
          permission_policy:
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              name: String,
              permission_policy:
                Anthropic::Beta::BetaManagedAgentsMCPToolConfig::PermissionPolicy::Variants
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
                Anthropic::Beta::BetaManagedAgentsMCPToolConfig::PermissionPolicy::Variants
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

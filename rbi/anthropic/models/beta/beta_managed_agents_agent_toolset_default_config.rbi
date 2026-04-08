# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolsetDefaultConfig =
      Beta::BetaManagedAgentsAgentToolsetDefaultConfig

    module Beta
      class BetaManagedAgentsAgentToolsetDefaultConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :enabled

        # Permission policy for tool execution.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig::PermissionPolicy::Variants
          )
        end
        attr_accessor :permission_policy

        # Resolved default configuration for agent tools.
        sig do
          params(
            enabled: T::Boolean,
            permission_policy:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          enabled:,
          # Permission policy for tool execution.
          permission_policy:
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              permission_policy:
                Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig::PermissionPolicy::Variants
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
                Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig::PermissionPolicy::Variants
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

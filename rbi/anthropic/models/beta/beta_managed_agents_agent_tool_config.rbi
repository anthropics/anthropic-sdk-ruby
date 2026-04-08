# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolConfig = Beta::BetaManagedAgentsAgentToolConfig

    module Beta
      class BetaManagedAgentsAgentToolConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :enabled

        # Built-in agent tool identifier.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
          )
        end
        attr_accessor :name

        # Permission policy for tool execution.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentToolConfig::PermissionPolicy::Variants
          )
        end
        attr_accessor :permission_policy

        # Configuration for a specific agent tool.
        sig do
          params(
            enabled: T::Boolean,
            name:
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::OrSymbol,
            permission_policy:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          enabled:,
          # Built-in agent tool identifier.
          name:,
          # Permission policy for tool execution.
          permission_policy:
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              name:
                Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol,
              permission_policy:
                Anthropic::Beta::BetaManagedAgentsAgentToolConfig::PermissionPolicy::Variants
            }
          )
        end
        def to_hash
        end

        # Built-in agent tool identifier.
        module Name
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BASH =
            T.let(
              :bash,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
            )
          EDIT =
            T.let(
              :edit,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
            )
          READ =
            T.let(
              :read,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
            )
          WRITE =
            T.let(
              :write,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
            )
          GLOB =
            T.let(
              :glob,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
            )
          GREP =
            T.let(
              :grep,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
            )
          WEB_FETCH =
            T.let(
              :web_fetch,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
            )
          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
                Anthropic::Beta::BetaManagedAgentsAgentToolConfig::PermissionPolicy::Variants
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

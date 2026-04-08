# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolConfigParams =
      Beta::BetaManagedAgentsAgentToolConfigParams

    module Beta
      class BetaManagedAgentsAgentToolConfigParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Built-in agent tool identifier.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::OrSymbol
          )
        end
        attr_accessor :name

        # Whether this tool is enabled and available to Claude. Overrides the
        # default_config setting.
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

        # Configuration override for a specific tool within a toolset.
        sig do
          params(
            name:
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::OrSymbol,
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
          # Built-in agent tool identifier.
          name:,
          # Whether this tool is enabled and available to Claude. Overrides the
          # default_config setting.
          enabled: nil,
          # Permission policy for tool execution.
          permission_policy: nil
        )
        end

        sig do
          override.returns(
            {
              name:
                Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::OrSymbol,
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

        # Built-in agent tool identifier.
        module Name
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BASH =
            T.let(
              :bash,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
            )
          EDIT =
            T.let(
              :edit,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
            )
          READ =
            T.let(
              :read,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
            )
          WRITE =
            T.let(
              :write,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
            )
          GLOB =
            T.let(
              :glob,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
            )
          GREP =
            T.let(
              :grep,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
            )
          WEB_FETCH =
            T.let(
              :web_fetch,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
            )
          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::PermissionPolicy::Variants
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

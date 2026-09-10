# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEditToolConfig = Beta::BetaManagedAgentsEditToolConfig

    module Beta
      class BetaManagedAgentsEditToolConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEditToolConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :enabled

        sig { returns(Symbol) }
        attr_accessor :name

        # Permission policy for tool execution.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsEditToolConfig::PermissionPolicy::Variants
          )
        end
        attr_accessor :permission_policy

        sig { returns(Symbol) }
        attr_accessor :type

        # Configuration for the edit tool.
        sig do
          params(
            enabled: T::Boolean,
            permission_policy:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
              ),
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          enabled:,
          # Permission policy for tool execution.
          permission_policy:,
          name: :edit,
          type: :edit
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              name: Symbol,
              permission_policy:
                Anthropic::Beta::BetaManagedAgentsEditToolConfig::PermissionPolicy::Variants,
              type: Symbol
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsEditToolConfig::PermissionPolicy::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALWAYS_ALLOW =
              T.let(
                :always_allow,
                Anthropic::Beta::BetaManagedAgentsEditToolConfig::PermissionPolicy::Type::TaggedSymbol
              )
            ALWAYS_ASK =
              T.let(
                :always_ask,
                Anthropic::Beta::BetaManagedAgentsEditToolConfig::PermissionPolicy::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsEditToolConfig::PermissionPolicy::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEditToolConfig::PermissionPolicy::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(type: T.any(Symbol, String)).returns(
              Anthropic::Beta::BetaManagedAgentsEditToolConfig::PermissionPolicy::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end

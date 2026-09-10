# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsGrepToolConfigParams =
      Beta::BetaManagedAgentsGrepToolConfigParams

    module Beta
      class BetaManagedAgentsGrepToolConfigParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Must be "grep".
        sig { returns(Symbol) }
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

        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Configuration override for the grep tool.
        sig do
          params(
            enabled: T.nilable(T::Boolean),
            permission_policy:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::OrHash
                )
              ),
            type:
              Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::Type::OrSymbol,
            name: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether this tool is enabled and available to Claude. Overrides the
          # default_config setting.
          enabled: nil,
          # Permission policy for tool execution.
          permission_policy: nil,
          type: nil,
          # Must be "grep".
          name: :grep
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              enabled: T.nilable(T::Boolean),
              permission_policy:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
                    Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy
                  )
                ),
              type:
                Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::Type::OrSymbol
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
                  Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::PermissionPolicy::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALWAYS_ALLOW =
              T.let(
                :always_allow,
                Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::PermissionPolicy::Type::TaggedSymbol
              )
            ALWAYS_ASK =
              T.let(
                :always_ask,
                Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::PermissionPolicy::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::PermissionPolicy::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::PermissionPolicy::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(type: T.any(Symbol, String)).returns(
              Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::PermissionPolicy::Variants
            )
          end
          def self.new(type:)
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GREP =
            T.let(
              :grep,
              Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsGrepToolConfigParams::Type::TaggedSymbol
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

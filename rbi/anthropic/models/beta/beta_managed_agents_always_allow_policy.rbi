# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAlwaysAllowPolicy =
      Beta::BetaManagedAgentsAlwaysAllowPolicy

    module Beta
      class BetaManagedAgentsAlwaysAllowPolicy < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Tool calls are automatically approved without user confirmation.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALWAYS_ALLOW =
            T.let(
              :always_allow,
              Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type::TaggedSymbol
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

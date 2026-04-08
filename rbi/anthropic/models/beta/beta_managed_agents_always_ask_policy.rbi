# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAlwaysAskPolicy = Beta::BetaManagedAgentsAlwaysAskPolicy

    module Beta
      class BetaManagedAgentsAlwaysAskPolicy < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Tool calls require user confirmation before execution.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALWAYS_ASK =
            T.let(
              :always_ask,
              Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::Type::TaggedSymbol
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

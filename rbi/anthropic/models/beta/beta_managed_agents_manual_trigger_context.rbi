# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsManualTriggerContext =
      Beta::BetaManagedAgentsManualTriggerContext

    module Beta
      class BetaManagedAgentsManualTriggerContext < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsManualTriggerContext,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsManualTriggerContext::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The run was started manually by creating a session directly against the
        # deployment.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsManualTriggerContext::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsManualTriggerContext::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsManualTriggerContext::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MANUAL =
            T.let(
              :manual,
              Anthropic::Beta::BetaManagedAgentsManualTriggerContext::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsManualTriggerContext::Type::TaggedSymbol
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

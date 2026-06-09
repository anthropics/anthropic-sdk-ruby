# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsManualDeploymentPausedReason =
      Beta::BetaManagedAgentsManualDeploymentPausedReason

    module Beta
      class BetaManagedAgentsManualDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The caller invoked the pause endpoint on the deployment.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MANUAL =
            T.let(
              :manual,
              Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason::Type::TaggedSymbol
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

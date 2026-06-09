# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsUnknownDeploymentPausedReasonError =
      Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsUnknownDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # An unrecognized error auto-paused the deployment. A fallback variant; matches a
        # run whose `error.type` is `unknown_error`.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          UNKNOWN_ERROR =
            T.let(
              :unknown_error,
              Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::Type::TaggedSymbol
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

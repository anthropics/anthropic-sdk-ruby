# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsFileNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsFileNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A file resource referenced by the deployment no longer exists.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FILE_NOT_FOUND_ERROR =
            T.let(
              :file_not_found_error,
              Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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

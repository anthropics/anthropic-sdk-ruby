# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionCreationRejectedRunError =
      Beta::BetaManagedAgentsSessionCreationRejectedRunError

    module Beta
      class BetaManagedAgentsSessionCreationRejectedRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The session create request was rejected with a non-retryable validation error.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION_CREATION_REJECTED_ERROR =
            T.let(
              :session_creation_rejected_error,
              Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type::TaggedSymbol
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

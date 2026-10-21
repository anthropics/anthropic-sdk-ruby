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

        sig { returns(Symbol) }
        attr_accessor :type

        # The session create request was rejected with a non-retryable validation error.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :session_creation_rejected_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

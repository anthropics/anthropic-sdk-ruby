# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsUnknownRunError = Beta::BetaManagedAgentsUnknownRunError

    module Beta
      class BetaManagedAgentsUnknownRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsUnknownRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        # An unknown or unexpected error caused the run to fail. A fallback variant;
        # clients that do not recognize a new error type can match on message alone.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :unknown_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

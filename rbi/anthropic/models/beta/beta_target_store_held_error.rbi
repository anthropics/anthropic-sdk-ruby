# typed: strong

module Anthropic
  module Models
    BetaTargetStoreHeldError = Beta::BetaTargetStoreHeldError

    module Beta
      class BetaTargetStoreHeldError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTargetStoreHeldError,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Returned with status 409 when a request to create a dream sets `output_behavior`
        # to `update_existing` and another dream that writes into the same memory store
        # hasn't fully stopped.
        #
        # The other dream is `pending` or `running`, or it has just stopped and is still
        # finishing its last writes. `message` gives the ID of the other dream when the
        # server can identify it. If that dream has already reached `completed`, `failed`,
        # or `canceled`, retry after a short wait. Otherwise, wait for the other dream to
        # end or cancel it, then retry. The response sets the `x-should-retry` header to
        # `false`.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(message: nil, type: :conflict_error)
        end

        sig { override.returns({ type: Symbol, message: String }) }
        def to_hash
        end
      end
    end
  end
end

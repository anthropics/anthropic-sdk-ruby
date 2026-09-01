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

        # Human-readable description of the conflict, naming the dream that holds the
        # target store when the server can identify it.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # The `output_behavior.memory_store_id` target is still held by a prior
        # `{type: "update_existing"}` dream — one that is `pending` or `running`, or was
        # canceled with its final writes still landing. Rarely the named dream has just
        # finished (`completed`/`failed`) and its execution is still closing; an immediate
        # retry then almost always succeeds. The message names the holding dream when the
        # server can identify it (rarely omitted); poll it to a terminal state or cancel
        # it, then retry. Carried with `x-should-retry: false`.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable description of the conflict, naming the dream that holds the
          # target store when the server can identify it.
          message: nil,
          type: :conflict_error
        )
        end

        sig { override.returns({ type: Symbol, message: String }) }
        def to_hash
        end
      end
    end
  end
end

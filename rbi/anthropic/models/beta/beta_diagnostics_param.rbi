# typed: strong

module Anthropic
  module Models
    BetaDiagnosticsParam = Beta::BetaDiagnosticsParam

    module Beta
      class BetaDiagnosticsParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDiagnosticsParam,
              Anthropic::Internal::AnyHash
            )
          end

        # The `id` (`msg_...`) from this client's previous /v1/messages response. The
        # server compares that request's prompt fingerprint against this one and returns
        # `diagnostics.cache_miss_reason` when the prompt-cache prefix could not be
        # reused. Pass `null` on the first turn to opt in without a prior message to
        # compare.
        sig { returns(T.nilable(String)) }
        attr_accessor :previous_message_id

        # Request-level diagnostics. Currently carries the previous response id for
        # prompt-cache divergence reporting.
        sig do
          params(previous_message_id: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The `id` (`msg_...`) from this client's previous /v1/messages response. The
          # server compares that request's prompt fingerprint against this one and returns
          # `diagnostics.cache_miss_reason` when the prompt-cache prefix could not be
          # reused. Pass `null` on the first turn to opt in without a prior message to
          # compare.
          previous_message_id: nil
        )
        end

        sig { override.returns({ previous_message_id: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    BetaFallbackBlockParam = Beta::BetaFallbackBlockParam

    module Beta
      class BetaFallbackBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        # Identifies one hop of a fallback transition.
        sig { returns(Anthropic::Beta::BetaFallbackInfoParam) }
        attr_reader :from

        sig do
          params(from: Anthropic::Beta::BetaFallbackInfoParam::OrHash).void
        end
        attr_writer :from

        # Identifies one hop of a fallback transition.
        sig { returns(Anthropic::Beta::BetaFallbackInfoParam) }
        attr_reader :to

        sig { params(to: Anthropic::Beta::BetaFallbackInfoParam::OrHash).void }
        attr_writer :to

        sig { returns(Symbol) }
        attr_accessor :type

        # The response block's `trigger`, echoed verbatim. Accepted and ignored by the
        # server; any object or `null` is allowed.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :trigger

        sig { params(trigger: T.anything).void }
        attr_writer :trigger

        # A `fallback` block echoed back from a prior response.
        #
        # Accepted in `messages[].content` and not rendered into the prompt; not validated
        # against the request's `fallbacks` chain or top-level `model`.
        #
        # Echo the assistant turn back verbatim, including this block in its original
        # position. The block marks the boundary between content produced before and after
        # a fallback hop, and the server relies on that boundary to validate the turn:
        # when thinking runs flank the boundary, omitting the block merges them into one
        # span the server cannot validate (the request is rejected), and moving it into
        # the middle of a single run is likewise rejected; between non-thinking blocks the
        # block's placement has no validation effect.
        sig do
          params(
            from: Anthropic::Beta::BetaFallbackInfoParam::OrHash,
            to: Anthropic::Beta::BetaFallbackInfoParam::OrHash,
            trigger: T.anything,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifies one hop of a fallback transition.
          from:,
          # Identifies one hop of a fallback transition.
          to:,
          # The response block's `trigger`, echoed verbatim. Accepted and ignored by the
          # server; any object or `null` is allowed.
          trigger: nil,
          type: :fallback
        )
        end

        sig do
          override.returns(
            {
              from: Anthropic::Beta::BetaFallbackInfoParam,
              to: Anthropic::Beta::BetaFallbackInfoParam,
              type: Symbol,
              trigger: T.anything
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

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

        # A `fallback` block echoed back from a prior response.
        #
        # Accepted in `messages[].content` and never rendered into the prompt, not
        # validated against the request's `fallbacks` chain or top-level `model`, and
        # stripped before the sticky-routing cache key is computed.
        #
        # Callers should echo the assistant turn verbatim — block included. The block's
        # position is load-bearing for thinking verification: the thinking runs on either
        # side of a fallback hop carry independently-rooted verification hash chains, and
        # this block is the only record of where one chain ends and the next begins. When
        # thinking runs flank the boundary, omitting the block merges the runs into one
        # contiguous span whose hashes cannot verify (the request is rejected), and moving
        # it into the middle of a single run splits that run's chain and is likewise
        # rejected; between non-thinking blocks the block's placement has no verification
        # effect.
        sig do
          params(
            from: Anthropic::Beta::BetaFallbackInfoParam::OrHash,
            to: Anthropic::Beta::BetaFallbackInfoParam::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifies one hop of a fallback transition.
          from:,
          # Identifies one hop of a fallback transition.
          to:,
          type: :fallback
        )
        end

        sig do
          override.returns(
            {
              from: Anthropic::Beta::BetaFallbackInfoParam,
              to: Anthropic::Beta::BetaFallbackInfoParam,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

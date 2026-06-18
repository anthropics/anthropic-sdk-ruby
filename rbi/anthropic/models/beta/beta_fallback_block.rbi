# typed: strong

module Anthropic
  module Models
    BetaFallbackBlock = Beta::BetaFallbackBlock

    module Beta
      class BetaFallbackBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackBlock,
              Anthropic::Internal::AnyHash
            )
          end

        # The model whose output ends at this point — the model that declined at this hop.
        # When the declining hop is the requested model, its `model` echoes the top-level
        # `model` string the caller sent (alias or canonical); when the declining hop is a
        # fallback model, its `model` is that model's canonical id.
        sig { returns(Anthropic::Beta::BetaFallbackInfo) }
        attr_reader :from

        sig { params(from: Anthropic::Beta::BetaFallbackInfo::OrHash).void }
        attr_writer :from

        # The fallback model producing the content that follows this block. Its `model` is
        # always the canonical id.
        sig { returns(Anthropic::Beta::BetaFallbackInfo) }
        attr_reader :to

        sig { params(to: Anthropic::Beta::BetaFallbackInfo::OrHash).void }
        attr_writer :to

        # What caused the `from` model to hand over at this hop.
        sig { returns(Anthropic::Beta::BetaFallbackRefusalTrigger) }
        attr_reader :trigger

        sig do
          params(
            trigger: Anthropic::Beta::BetaFallbackRefusalTrigger::OrHash
          ).void
        end
        attr_writer :trigger

        sig { returns(Symbol) }
        attr_accessor :type

        # Marks the point in `content` where one model's output gives way to the next.
        #
        # One block appears per hop where a preceding model actually ran this turn and
        # declined. A turn where no preceding model ran and declined has no such boundary
        # and carries no block — the signal for whether a fallback model served the
        # response is the presence of a `fallback_message` entry in `usage.iterations`,
        # not this block.
        #
        # The block is treated like a server-tool content block for streaming: it arrives
        # via the standard `content_block_start` / `content_block_stop` pair and carries
        # no deltas.
        sig do
          params(
            from: Anthropic::Beta::BetaFallbackInfo::OrHash,
            to: Anthropic::Beta::BetaFallbackInfo::OrHash,
            trigger: Anthropic::Beta::BetaFallbackRefusalTrigger::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The model whose output ends at this point — the model that declined at this hop.
          # When the declining hop is the requested model, its `model` echoes the top-level
          # `model` string the caller sent (alias or canonical); when the declining hop is a
          # fallback model, its `model` is that model's canonical id.
          from:,
          # The fallback model producing the content that follows this block. Its `model` is
          # always the canonical id.
          to:,
          # What caused the `from` model to hand over at this hop.
          trigger:,
          type: :fallback
        )
        end

        sig do
          override.returns(
            {
              from: Anthropic::Beta::BetaFallbackInfo,
              to: Anthropic::Beta::BetaFallbackInfo,
              trigger: Anthropic::Beta::BetaFallbackRefusalTrigger,
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

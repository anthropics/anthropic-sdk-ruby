# typed: strong

module Anthropic
  module Helpers
    module Tools
      # @api private
      #
      class Runner
        sig { returns(Anthropic::Models::Beta::MessageCreateParams) }
        attr_accessor :params

        sig { returns(T::Boolean) }
        def finished?
        end

        sig do
          params(
            messages:
              T.any(
                Anthropic::Beta::BetaMessageParam::Variants,
                Anthropic::Internal::AnyHash
              )
          ).void
        end
        def feed_messages(*messages)
        end

        sig do
          params(
            tools:
              T.any(
                Anthropic::Helpers::Tools::BaseTool,
                Anthropic::Beta::BetaToolUnion::Variants,
                T::Hash[Symbol, T.anything]
              )
          ).void
        end
        def add_tools(*tools)
        end

        sig do
          params(
            tools: T.any(Anthropic::Helpers::Tools::BaseTool, String, Symbol)
          ).void
        end
        def remove_tools(*tools)
        end

        sig do
          params(
            compaction: T.nilable(Anthropic::Beta::BetaCompactionConfig::OrHash)
          ).void
        end
        def compact_before_next_turn(compaction = nil)
        end

        sig { returns(Anthropic::Models::BetaMessage) }
        def next_message
        end

        sig { returns(T::Array[Anthropic::Models::BetaMessage]) }
        def run_until_finished
        end

        sig do
          params(
            blk: T.proc.params(arg0: Anthropic::Models::BetaMessage).void
          ).void
        end
        def each_message(&blk)
        end

        sig do
          params(
            blk: T.proc.params(arg0: Anthropic::Streaming::MessageStream).void
          ).void
        end
        def each_streaming(&blk)
        end
      end
    end
  end
end

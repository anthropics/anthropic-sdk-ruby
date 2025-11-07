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
        def finished?; end

        sig { params(messages: Anthropic::Models::Beta::BetaMessageParam).void }
        def feed_messages(*messages); end

        sig { returns(Anthropic::Models::BetaMessage) }
        def next_message; end

        sig { returns(T::Array[Anthropic::Models::BetaMessage]) }
        def run_until_finished; end

        sig do
          params(
            blk: T.proc.params(arg0: Anthropic::Models::BetaMessage).void
          ).void
        end
        def each_message(&blk); end

        sig do
          params(
            blk: T.proc.params(arg0: Anthropic::Streaming::MessageStream).void
          ).void
        end
        def each_streaming(&blk); end
      end
    end
  end
end

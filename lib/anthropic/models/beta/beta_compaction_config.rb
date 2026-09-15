# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCompactionConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :summarize]
        required :type, const: :summarize

        # @!attribute instructions
        #   Replaces the server's summarization prompt for this request. When set, earlier
        #   thinking blocks are left out of the content being summarized on models that
        #   require it.
        #
        #   @return [String, nil]
        optional :instructions, String, nil?: true

        # @!method initialize(instructions: nil, type: :summarize)
        #   Compact the whole conversation and return a signed `compaction` block, alone,
        #   that a later request sends back first in `messages`, in place of the messages it
        #   summarizes. There is no trigger and no pause flag: sending the parameter
        #   compacts, and nothing is sampled after the block.
        #
        #   The summarization prompt is the server's own unless `instructions` are given,
        #   which then replace it for this request; a value that is empty or only whitespace
        #   counts as absent.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCompactionConfig} for more details.
        #
        #   @param instructions [String, nil] Replaces the server's summarization prompt for this request. When set, earlier t
        #
        #   @param type [Symbol, :summarize]
      end
    end

    BetaCompactionConfig = Beta::BetaCompactionConfig
  end
end

# typed: strong

module Anthropic
  module Models
    BetaCompactionConfig = Beta::BetaCompactionConfig

    module Beta
      class BetaCompactionConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCompactionConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Replaces the server's summarization prompt for this request. When set, earlier
        # thinking blocks are left out of the content being summarized on models that
        # require it.
        sig { returns(T.nilable(String)) }
        attr_accessor :instructions

        # Compact the whole conversation and return a signed `compaction` block, alone,
        # that a later request sends back first in `messages`, in place of the messages it
        # summarizes. There is no trigger and no pause flag: sending the parameter
        # compacts, and nothing is sampled after the block.
        #
        # The summarization prompt is the server's own unless `instructions` are given,
        # which then replace it for this request; a value that is empty or only whitespace
        # counts as absent.
        sig do
          params(instructions: T.nilable(String), type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Replaces the server's summarization prompt for this request. When set, earlier
          # thinking blocks are left out of the content being summarized on models that
          # require it.
          instructions: nil,
          type: :summarize
        )
        end

        sig do
          override.returns({ type: Symbol, instructions: T.nilable(String) })
        end
        def to_hash
        end
      end
    end
  end
end

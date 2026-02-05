# typed: strong

module Anthropic
  module Models
    BetaCompact20260112Edit = Beta::BetaCompact20260112Edit

    module Beta
      class BetaCompact20260112Edit < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCompact20260112Edit,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Additional instructions for summarization.
        sig { returns(T.nilable(String)) }
        attr_accessor :instructions

        # Whether to pause after compaction and return the compaction block to the user.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :pause_after_compaction

        sig { params(pause_after_compaction: T::Boolean).void }
        attr_writer :pause_after_compaction

        # When to trigger compaction. Defaults to 150000 input tokens.
        sig { returns(T.nilable(Anthropic::Beta::BetaInputTokensTrigger)) }
        attr_reader :trigger

        sig do
          params(
            trigger: T.nilable(Anthropic::Beta::BetaInputTokensTrigger::OrHash)
          ).void
        end
        attr_writer :trigger

        # Automatically compact older context when reaching the configured trigger
        # threshold.
        sig do
          params(
            instructions: T.nilable(String),
            pause_after_compaction: T::Boolean,
            trigger: T.nilable(Anthropic::Beta::BetaInputTokensTrigger::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Additional instructions for summarization.
          instructions: nil,
          # Whether to pause after compaction and return the compaction block to the user.
          pause_after_compaction: nil,
          # When to trigger compaction. Defaults to 150000 input tokens.
          trigger: nil,
          type: :compact_20260112
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              instructions: T.nilable(String),
              pause_after_compaction: T::Boolean,
              trigger: T.nilable(Anthropic::Beta::BetaInputTokensTrigger)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

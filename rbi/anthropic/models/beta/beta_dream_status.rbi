# typed: strong

module Anthropic
  module Models
    BetaDreamStatus = Beta::BetaDreamStatus

    module Beta
      # Lifecycle status of a Dream.
      module BetaDreamStatus
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::Beta::BetaDreamStatus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The dream is waiting to start and hasn't read its inputs yet.
        #
        # `outputs` is empty and every `usage` count is zero.
        PENDING =
          T.let(:pending, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)

        # The dream is reading its inputs and writing its result.
        #
        # `usage` updates while the dream has this status.
        RUNNING =
          T.let(:running, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)

        # The dream finished and its output memory store holds the complete result.
        COMPLETED =
          T.let(:completed, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)

        # The dream stopped with an error, which `error` describes.
        #
        # If `outputs` references a memory store, that memory store keeps what the dream wrote before it stopped.
        FAILED = T.let(:failed, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)

        # The caller canceled the dream before it completed.
        CANCELED =
          T.let(:canceled, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaDreamStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

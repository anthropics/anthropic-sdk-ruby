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

        PENDING =
          T.let(:pending, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)
        RUNNING =
          T.let(:running, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)
        COMPLETED =
          T.let(:completed, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)
        FAILED = T.let(:failed, Anthropic::Beta::BetaDreamStatus::TaggedSymbol)
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

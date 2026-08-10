# typed: strong

module Anthropic
  module Models
    BetaOutputBehavior = Beta::BetaOutputBehavior

    module Beta
      # The default destination: the job creates a new output memory store as a clone of
      # the memory_store input and writes the consolidated memories into it. The input
      # store is never mutated.
      module BetaOutputBehavior
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaOutputBehaviorCreateNew,
              Anthropic::Beta::BetaOutputBehaviorUpdateExisting
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaOutputBehavior::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(type: T.any(Symbol, String), memory_store_id: String).returns(
            Anthropic::Beta::BetaOutputBehavior::Variants
          )
        end
        def self.new(type:, memory_store_id: nil)
        end
      end
    end
  end
end

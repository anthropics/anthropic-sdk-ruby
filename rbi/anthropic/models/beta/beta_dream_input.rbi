# typed: strong

module Anthropic
  module Models
    BetaDreamInput = Beta::BetaDreamInput

    module Beta
      # An input memory store the dream reads from. The dream never mutates this store
      # unless it is also the destination: with output_behavior {type:
      # "update_existing"} the job consolidates this store in place.
      module BetaDreamInput
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamMemoryStoreInput,
              Anthropic::Beta::BetaDreamSessionsInput
            )
          end

        sig do
          override.returns(T::Array[Anthropic::Beta::BetaDreamInput::Variants])
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            memory_store_id: String,
            session_ids: T::Array[String]
          ).returns(Anthropic::Beta::BetaDreamInput::Variants)
        end
        def self.new(type:, memory_store_id: nil, session_ids: nil)
        end
      end
    end
  end
end

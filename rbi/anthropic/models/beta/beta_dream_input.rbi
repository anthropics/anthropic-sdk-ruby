# typed: strong

module Anthropic
  module Models
    BetaDreamInput = Beta::BetaDreamInput

    module Beta
      # An input memory store the dream reads from. The dream never mutates this store.
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
      end
    end
  end
end

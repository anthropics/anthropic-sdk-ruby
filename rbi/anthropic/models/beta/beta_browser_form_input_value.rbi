# typed: strong

module Anthropic
  module Models
    BetaBrowserFormInputValue = Beta::BetaBrowserFormInputValue

    module Beta
      module BetaBrowserFormInputValue
        extend Anthropic::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Float, T::Boolean) }

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaBrowserFormInputValue::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

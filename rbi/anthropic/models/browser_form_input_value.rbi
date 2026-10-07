# typed: strong

module Anthropic
  module Models
    module BrowserFormInputValue
      extend Anthropic::Internal::Type::Union

      Variants = T.type_alias { T.any(String, Float, T::Boolean) }

      sig do
        override.returns(T::Array[Anthropic::BrowserFormInputValue::Variants])
      end
      def self.variants
      end
    end
  end
end

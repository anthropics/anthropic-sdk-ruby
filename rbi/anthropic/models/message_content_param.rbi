# typed: strong

module Anthropic
  module Models
    module MessageContentParam
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(String, T::Array[Anthropic::ContentBlockParam::Variants])
        end

      sig do
        override.returns(T::Array[Anthropic::MessageContentParam::Variants])
      end
      def self.variants
      end

      ContentBlockParamArray =
        T.let(
          Anthropic::Internal::Type::ArrayOf[
            union: Anthropic::ContentBlockParam
          ],
          Anthropic::Internal::Type::Converter
        )
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Anthropic::TextBlockParam, Anthropic::ImageBlockParam)
        end

      sig do
        override.returns(
          T::Array[Anthropic::ContentBlockSourceContent::Variants]
        )
      end
      def self.variants
      end
    end
  end
end

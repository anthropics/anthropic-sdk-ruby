# typed: strong

module Anthropic
  module Models
    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent

    module Beta
      module BetaContentBlockSourceContent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextBlockParam,
              Anthropic::Beta::BetaImageBlockParam
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaContentBlockSourceContent::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

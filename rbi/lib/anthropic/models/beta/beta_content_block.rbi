# typed: strong

module Anthropic
  module Models
    BetaContentBlock = T.type_alias { Beta::BetaContentBlock }

    module Beta
      class BetaContentBlock < Anthropic::Union
        abstract!

        sig do
          override.returns(
            [
              [Symbol, Anthropic::Models::Beta::BetaTextBlock],
              [Symbol, Anthropic::Models::Beta::BetaToolUseBlock]
            ]
          )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    BetaToolsetToolUseBlock = Beta::BetaToolsetToolUseBlock

    module Beta
      module BetaToolsetToolUseBlock
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserToolUseBlock::Variants,
              Anthropic::Beta::BetaComputerToolUseBlock::Variants,
              Anthropic::Beta::BetaToolUseBlock
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaToolsetToolUseBlock::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

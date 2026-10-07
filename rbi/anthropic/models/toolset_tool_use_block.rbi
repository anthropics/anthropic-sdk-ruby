# typed: strong

module Anthropic
  module Models
    module ToolsetToolUseBlock
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::BrowserToolUseBlock::Variants,
            Anthropic::ComputerToolUseBlock::Variants,
            Anthropic::ToolUseBlock
          )
        end

      sig do
        override.returns(T::Array[Anthropic::ToolsetToolUseBlock::Variants])
      end
      def self.variants
      end
    end
  end
end

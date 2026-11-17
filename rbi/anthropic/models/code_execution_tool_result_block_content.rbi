# typed: strong

module Anthropic
  module Models
    module CodeExecutionToolResultBlockContent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::CodeExecutionToolResultErrorObject,
            Anthropic::CodeExecutionResultBlock,
            Anthropic::EncryptedCodeExecutionResultBlock
          )
        end

      sig do
        override.returns(
          T::Array[Anthropic::CodeExecutionToolResultBlockContent::Variants]
        )
      end
      def self.variants
      end
    end
  end
end

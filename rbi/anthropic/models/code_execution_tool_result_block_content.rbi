# typed: strong

module Anthropic
  module Models
    # Code execution result with encrypted stdout for PFC + web_search results.
    module CodeExecutionToolResultBlockContent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::CodeExecutionToolResultError,
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

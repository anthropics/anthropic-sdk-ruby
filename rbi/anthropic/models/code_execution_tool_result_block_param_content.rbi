# typed: strong

module Anthropic
  module Models
    # Code execution result with encrypted stdout for PFC + web_search results.
    module CodeExecutionToolResultBlockParamContent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::CodeExecutionToolResultErrorParam,
            Anthropic::CodeExecutionResultBlockParam,
            Anthropic::EncryptedCodeExecutionResultBlockParam
          )
        end

      sig do
        override.returns(
          T::Array[
            Anthropic::CodeExecutionToolResultBlockParamContent::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end

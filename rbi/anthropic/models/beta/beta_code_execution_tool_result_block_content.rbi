# typed: strong

module Anthropic
  module Models
    BetaCodeExecutionToolResultBlockContent =
      Beta::BetaCodeExecutionToolResultBlockContent

    module Beta
      # Code execution result with encrypted stdout for PFC + web_search results.
      module BetaCodeExecutionToolResultBlockContent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCodeExecutionToolResultError,
              Anthropic::Beta::BetaCodeExecutionResultBlock,
              Anthropic::Beta::BetaEncryptedCodeExecutionResultBlock
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaCodeExecutionToolResultBlockContent::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end

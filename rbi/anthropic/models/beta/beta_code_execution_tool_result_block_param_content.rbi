# typed: strong

module Anthropic
  module Models
    BetaCodeExecutionToolResultBlockParamContent =
      Beta::BetaCodeExecutionToolResultBlockParamContent

    module Beta
      # Code execution result with encrypted stdout for PFC + web_search results.
      module BetaCodeExecutionToolResultBlockParamContent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCodeExecutionToolResultErrorParam,
              Anthropic::Beta::BetaCodeExecutionResultBlockParam,
              Anthropic::Beta::BetaEncryptedCodeExecutionResultBlockParam
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaCodeExecutionToolResultBlockParamContent::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end

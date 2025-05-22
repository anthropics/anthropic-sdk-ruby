# typed: strong

module Anthropic
  module Models
    BetaToolUnion = Beta::BetaToolUnion

    module Beta
      module BetaToolUnion
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTool,
              Anthropic::Beta::BetaToolComputerUse20241022,
              Anthropic::Beta::BetaToolBash20241022,
              Anthropic::Beta::BetaToolTextEditor20241022,
              Anthropic::Beta::BetaToolComputerUse20250124,
              Anthropic::Beta::BetaToolBash20250124,
              Anthropic::Beta::BetaToolTextEditor20250124,
              Anthropic::Beta::BetaToolTextEditor20250429,
              Anthropic::Beta::BetaWebSearchTool20250305,
              Anthropic::Beta::BetaCodeExecutionTool20250522
            )
          end

        sig do
          override.returns(T::Array[Anthropic::Beta::BetaToolUnion::Variants])
        end
        def self.variants
        end
      end
    end
  end
end

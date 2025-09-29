# typed: strong

module Anthropic
  module Models
    BetaMemoryTool20250818Command = Beta::BetaMemoryTool20250818Command

    module Beta
      module BetaMemoryTool20250818Command
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMemoryTool20250818ViewCommand,
              Anthropic::Beta::BetaMemoryTool20250818CreateCommand,
              Anthropic::Beta::BetaMemoryTool20250818StrReplaceCommand,
              Anthropic::Beta::BetaMemoryTool20250818InsertCommand,
              Anthropic::Beta::BetaMemoryTool20250818DeleteCommand,
              Anthropic::Beta::BetaMemoryTool20250818RenameCommand
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaMemoryTool20250818Command::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

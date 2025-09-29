# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaMemoryTool20250818Command
        extend Anthropic::Internal::Type::Union

        discriminator :command

        variant :view, -> { Anthropic::Beta::BetaMemoryTool20250818ViewCommand }

        variant :create, -> { Anthropic::Beta::BetaMemoryTool20250818CreateCommand }

        variant :str_replace, -> { Anthropic::Beta::BetaMemoryTool20250818StrReplaceCommand }

        variant :insert, -> { Anthropic::Beta::BetaMemoryTool20250818InsertCommand }

        variant :delete, -> { Anthropic::Beta::BetaMemoryTool20250818DeleteCommand }

        variant :rename, -> { Anthropic::Beta::BetaMemoryTool20250818RenameCommand }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaMemoryTool20250818ViewCommand, Anthropic::Models::Beta::BetaMemoryTool20250818CreateCommand, Anthropic::Models::Beta::BetaMemoryTool20250818StrReplaceCommand, Anthropic::Models::Beta::BetaMemoryTool20250818InsertCommand, Anthropic::Models::Beta::BetaMemoryTool20250818DeleteCommand, Anthropic::Models::Beta::BetaMemoryTool20250818RenameCommand)]
      end
    end

    BetaMemoryTool20250818Command = Beta::BetaMemoryTool20250818Command
  end
end

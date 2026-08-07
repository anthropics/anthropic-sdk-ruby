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

        # Creates a new instance of the variant class whose `command` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            command: T.any(Symbol, String),
            path: String,
            view_range: T::Array[Integer],
            file_text: String,
            new_str: String,
            old_str: String,
            insert_line: Integer,
            insert_text: String,
            new_path: String,
            old_path: String
          ).returns(Anthropic::Beta::BetaMemoryTool20250818Command::Variants)
        end
        def self.new(
          command:,
          # Path to directory or file to view
          path: nil,
          # Optional line range for viewing specific lines
          view_range: nil,
          # Content to write to the file
          file_text: nil,
          # Text to replace with
          new_str: nil,
          # Text to search for and replace
          old_str: nil,
          # Line number where text should be inserted
          insert_line: nil,
          # Text to insert at the specified line
          insert_text: nil,
          # New path for the file or directory
          new_path: nil,
          # Current path of the file or directory
          old_path: nil
        )
        end
      end
    end
  end
end

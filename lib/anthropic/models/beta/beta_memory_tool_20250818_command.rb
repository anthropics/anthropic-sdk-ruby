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

        module Command
          extend Anthropic::Internal::Type::Enum

          VIEW = :view
          CREATE = :create
          STR_REPLACE = :str_replace
          INSERT = :insert
          DELETE = :delete
          RENAME = :rename

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaMemoryTool20250818ViewCommand, Anthropic::Models::Beta::BetaMemoryTool20250818CreateCommand, Anthropic::Models::Beta::BetaMemoryTool20250818StrReplaceCommand, Anthropic::Models::Beta::BetaMemoryTool20250818InsertCommand, Anthropic::Models::Beta::BetaMemoryTool20250818DeleteCommand, Anthropic::Models::Beta::BetaMemoryTool20250818RenameCommand)]

        # Creates a new instance of the variant class whose `command` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param command [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :path Path to directory or file to view
        #
        #   @option args [Array<Integer>] :view_range Optional line range for viewing specific lines
        #
        #   @option args [String] :file_text Content to write to the file
        #
        #   @option args [String] :new_str Text to replace with
        #
        #   @option args [String] :old_str Text to search for and replace
        #
        #   @option args [Integer] :insert_line Line number where text should be inserted
        #
        #   @option args [String] :insert_text Text to insert at the specified line
        #
        #   @option args [String] :new_path New path for the file or directory
        #
        #   @option args [String] :old_path Current path of the file or directory
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaMemoryTool20250818ViewCommand, Anthropic::Models::Beta::BetaMemoryTool20250818CreateCommand, Anthropic::Models::Beta::BetaMemoryTool20250818StrReplaceCommand, Anthropic::Models::Beta::BetaMemoryTool20250818InsertCommand, Anthropic::Models::Beta::BetaMemoryTool20250818DeleteCommand, Anthropic::Models::Beta::BetaMemoryTool20250818RenameCommand]
        def self.new(command:, **args)
          case command.to_sym
          when :view
            Anthropic::Beta::BetaMemoryTool20250818ViewCommand.new(**args)
          when :create
            Anthropic::Beta::BetaMemoryTool20250818CreateCommand.new(**args)
          when :str_replace
            Anthropic::Beta::BetaMemoryTool20250818StrReplaceCommand.new(**args)
          when :insert
            Anthropic::Beta::BetaMemoryTool20250818InsertCommand.new(**args)
          when :delete
            Anthropic::Beta::BetaMemoryTool20250818DeleteCommand.new(**args)
          when :rename
            Anthropic::Beta::BetaMemoryTool20250818RenameCommand.new(**args)
          else
            raise ArgumentError, "unknown command: #{command}"
          end
        end
      end
    end

    BetaMemoryTool20250818Command = Beta::BetaMemoryTool20250818Command
  end
end

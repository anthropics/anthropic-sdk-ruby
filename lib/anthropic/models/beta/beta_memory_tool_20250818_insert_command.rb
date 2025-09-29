# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMemoryTool20250818InsertCommand < Anthropic::Internal::Type::BaseModel
        # @!attribute command
        #   Command type identifier
        #
        #   @return [Symbol, :insert]
        required :command, const: :insert

        # @!attribute insert_line
        #   Line number where text should be inserted
        #
        #   @return [Integer]
        required :insert_line, Integer

        # @!attribute insert_text
        #   Text to insert at the specified line
        #
        #   @return [String]
        required :insert_text, String

        # @!attribute path
        #   Path to the file where text should be inserted
        #
        #   @return [String]
        required :path, String

        # @!method initialize(insert_line:, insert_text:, path:, command: :insert)
        #   @param insert_line [Integer] Line number where text should be inserted
        #
        #   @param insert_text [String] Text to insert at the specified line
        #
        #   @param path [String] Path to the file where text should be inserted
        #
        #   @param command [Symbol, :insert] Command type identifier
      end
    end

    BetaMemoryTool20250818InsertCommand = Beta::BetaMemoryTool20250818InsertCommand
  end
end

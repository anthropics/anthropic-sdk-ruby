# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMemoryTool20250818StrReplaceCommand < Anthropic::Internal::Type::BaseModel
        # @!attribute command
        #   Command type identifier
        #
        #   @return [Symbol, :str_replace]
        required :command, const: :str_replace

        # @!attribute new_str
        #   Text to replace with
        #
        #   @return [String]
        required :new_str, String

        # @!attribute old_str
        #   Text to search for and replace
        #
        #   @return [String]
        required :old_str, String

        # @!attribute path
        #   Path to the file where text should be replaced
        #
        #   @return [String]
        required :path, String

        # @!method initialize(new_str:, old_str:, path:, command: :str_replace)
        #   @param new_str [String] Text to replace with
        #
        #   @param old_str [String] Text to search for and replace
        #
        #   @param path [String] Path to the file where text should be replaced
        #
        #   @param command [Symbol, :str_replace] Command type identifier
      end
    end

    BetaMemoryTool20250818StrReplaceCommand = Beta::BetaMemoryTool20250818StrReplaceCommand
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMemoryTool20250818RenameCommand < Anthropic::Internal::Type::BaseModel
        # @!attribute command
        #   Command type identifier
        #
        #   @return [Symbol, :rename]
        required :command, const: :rename

        # @!attribute new_path
        #   New path for the file or directory
        #
        #   @return [String]
        required :new_path, String

        # @!attribute old_path
        #   Current path of the file or directory
        #
        #   @return [String]
        required :old_path, String

        # @!method initialize(new_path:, old_path:, command: :rename)
        #   @param new_path [String] New path for the file or directory
        #
        #   @param old_path [String] Current path of the file or directory
        #
        #   @param command [Symbol, :rename] Command type identifier
      end
    end

    BetaMemoryTool20250818RenameCommand = Beta::BetaMemoryTool20250818RenameCommand
  end
end

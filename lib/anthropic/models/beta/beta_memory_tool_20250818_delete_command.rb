# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMemoryTool20250818DeleteCommand < Anthropic::Internal::Type::BaseModel
        # @!attribute command
        #   Command type identifier
        #
        #   @return [Symbol, :delete]
        required :command, const: :delete

        # @!attribute path
        #   Path to the file or directory to delete
        #
        #   @return [String]
        required :path, String

        # @!method initialize(path:, command: :delete)
        #   @param path [String] Path to the file or directory to delete
        #
        #   @param command [Symbol, :delete] Command type identifier
      end
    end

    BetaMemoryTool20250818DeleteCommand = Beta::BetaMemoryTool20250818DeleteCommand
  end
end

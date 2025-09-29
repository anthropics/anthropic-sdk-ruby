# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMemoryTool20250818CreateCommand < Anthropic::Internal::Type::BaseModel
        # @!attribute command
        #   Command type identifier
        #
        #   @return [Symbol, :create]
        required :command, const: :create

        # @!attribute file_text
        #   Content to write to the file
        #
        #   @return [String]
        required :file_text, String

        # @!attribute path
        #   Path where the file should be created
        #
        #   @return [String]
        required :path, String

        # @!method initialize(file_text:, path:, command: :create)
        #   @param file_text [String] Content to write to the file
        #
        #   @param path [String] Path where the file should be created
        #
        #   @param command [Symbol, :create] Command type identifier
      end
    end

    BetaMemoryTool20250818CreateCommand = Beta::BetaMemoryTool20250818CreateCommand
  end
end

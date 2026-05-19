# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401WriteInput < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   Full file contents to write.
        #
        #   @return [String]
        required :content, String

        # @!attribute file_path
        #   Path of the file to write.
        #
        #   @return [String]
        required :file_path, String

        # @!method initialize(content:, file_path:)
        #   Input payload for the `write` tool. Writes (overwriting) the entire file
        #   contents.
        #
        #   @param content [String] Full file contents to write.
        #
        #   @param file_path [String] Path of the file to write.
      end
    end

    BetaManagedAgentsAgentToolset20260401WriteInput = Beta::BetaManagedAgentsAgentToolset20260401WriteInput
  end
end

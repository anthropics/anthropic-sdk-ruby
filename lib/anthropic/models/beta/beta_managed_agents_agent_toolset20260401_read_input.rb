# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401ReadInput < Anthropic::Internal::Type::BaseModel
        # @!attribute file_path
        #   Path of the file to read.
        #
        #   @return [String]
        required :file_path, String

        # @!attribute view_range
        #   Optional `[start_line, end_line]` 1-indexed inclusive range. When omitted the
        #   entire file is returned. `end_line` of 0 or negative means "to end of file".
        #
        #   @return [Array<Integer>, nil]
        optional :view_range, Anthropic::Internal::Type::ArrayOf[Integer]

        # @!method initialize(file_path:, view_range: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401ReadInput} for
        #   more details.
        #
        #   Input payload for the `read` tool. Reads file contents relative to the runner's
        #   working directory (or absolute when the runner permits).
        #
        #   @param file_path [String] Path of the file to read.
        #
        #   @param view_range [Array<Integer>] Optional `[start_line, end_line]` 1-indexed inclusive
      end
    end

    BetaManagedAgentsAgentToolset20260401ReadInput = Beta::BetaManagedAgentsAgentToolset20260401ReadInput
  end
end

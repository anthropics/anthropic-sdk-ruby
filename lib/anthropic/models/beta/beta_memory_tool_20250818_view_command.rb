# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMemoryTool20250818ViewCommand < Anthropic::Internal::Type::BaseModel
        # @!attribute command
        #   Command type identifier
        #
        #   @return [Symbol, :view]
        required :command, const: :view

        # @!attribute path
        #   Path to directory or file to view
        #
        #   @return [String]
        required :path, String

        # @!attribute view_range
        #   Optional line range for viewing specific lines
        #
        #   @return [Array<Integer>, nil]
        optional :view_range, Anthropic::Internal::Type::ArrayOf[Integer]

        # @!method initialize(path:, view_range: nil, command: :view)
        #   @param path [String] Path to directory or file to view
        #
        #   @param view_range [Array<Integer>] Optional line range for viewing specific lines
        #
        #   @param command [Symbol, :view] Command type identifier
      end
    end

    BetaMemoryTool20250818ViewCommand = Beta::BetaMemoryTool20250818ViewCommand
  end
end

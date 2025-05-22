# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCodeExecutionTool20250522 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :code_execution]
        required :name, const: :code_execution

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_20250522]
        required :type, const: :code_execution_20250522

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(cache_control: nil, name: :code_execution, type: :code_execution_20250522)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCodeExecutionTool20250522} for more details.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param name [Symbol, :code_execution] Name of the tool.
        #
        #   @param type [Symbol, :code_execution_20250522]
      end
    end

    BetaCodeExecutionTool20250522 = Beta::BetaCodeExecutionTool20250522
  end
end

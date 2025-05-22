# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaCodeExecutionResultBlockParam]
        required :content, union: -> { Anthropic::Beta::BetaCodeExecutionToolResultBlockParamContent }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_tool_result]
        required :type, const: :code_execution_tool_result

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :code_execution_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaCodeExecutionResultBlockParam]
        #
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :code_execution_tool_result]
      end
    end

    BetaCodeExecutionToolResultBlockParam = Beta::BetaCodeExecutionToolResultBlockParam
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    class CodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #   Code execution result with encrypted stdout for PFC + web_search results.
      #
      #   @return [Anthropic::Models::CodeExecutionToolResultErrorParam, Anthropic::Models::CodeExecutionResultBlockParam, Anthropic::Models::EncryptedCodeExecutionResultBlockParam]
      required :content, union: -> { Anthropic::CodeExecutionToolResultBlockParamContent }

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
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :code_execution_tool_result)
      #   @param content [Anthropic::Models::CodeExecutionToolResultErrorParam, Anthropic::Models::CodeExecutionResultBlockParam, Anthropic::Models::EncryptedCodeExecutionResultBlockParam] Code execution result with encrypted stdout for PFC + web_search results.
      #
      #   @param tool_use_id [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :code_execution_tool_result]
    end
  end
end

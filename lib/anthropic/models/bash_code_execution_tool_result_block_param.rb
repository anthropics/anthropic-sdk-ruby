# frozen_string_literal: true

module Anthropic
  module Models
    class BashCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Anthropic::Models::BashCodeExecutionToolResultErrorParam, Anthropic::Models::BashCodeExecutionResultBlockParam]
      required :content, union: -> { Anthropic::BashCodeExecutionToolResultBlockParam::Content }

      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :bash_code_execution_tool_result]
      required :type, const: :bash_code_execution_tool_result

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :bash_code_execution_tool_result)
      #   @param content [Anthropic::Models::BashCodeExecutionToolResultErrorParam, Anthropic::Models::BashCodeExecutionResultBlockParam]
      #
      #   @param tool_use_id [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :bash_code_execution_tool_result]

      # @see Anthropic::Models::BashCodeExecutionToolResultBlockParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::BashCodeExecutionToolResultErrorParam }

        variant -> { Anthropic::BashCodeExecutionResultBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::BashCodeExecutionToolResultErrorParam, Anthropic::Models::BashCodeExecutionResultBlockParam)]
      end
    end
  end
end

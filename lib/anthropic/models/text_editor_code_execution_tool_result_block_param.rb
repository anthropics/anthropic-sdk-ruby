# frozen_string_literal: true

module Anthropic
  module Models
    class TextEditorCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Anthropic::Models::TextEditorCodeExecutionToolResultErrorParam, Anthropic::Models::TextEditorCodeExecutionViewResultBlockParam, Anthropic::Models::TextEditorCodeExecutionCreateResultBlockParam, Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlockParam]
      required :content, union: -> { Anthropic::TextEditorCodeExecutionToolResultBlockParam::Content }

      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_code_execution_tool_result]
      required :type, const: :text_editor_code_execution_tool_result

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :text_editor_code_execution_tool_result)
      #   @param content [Anthropic::Models::TextEditorCodeExecutionToolResultErrorParam, Anthropic::Models::TextEditorCodeExecutionViewResultBlockParam, Anthropic::Models::TextEditorCodeExecutionCreateResultBlockParam, Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlockParam]
      #
      #   @param tool_use_id [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :text_editor_code_execution_tool_result]

      # @see Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::TextEditorCodeExecutionToolResultErrorParam }

        variant -> { Anthropic::TextEditorCodeExecutionViewResultBlockParam }

        variant -> { Anthropic::TextEditorCodeExecutionCreateResultBlockParam }

        variant -> { Anthropic::TextEditorCodeExecutionStrReplaceResultBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::TextEditorCodeExecutionToolResultErrorParam, Anthropic::Models::TextEditorCodeExecutionViewResultBlockParam, Anthropic::Models::TextEditorCodeExecutionCreateResultBlockParam, Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlockParam)]
      end
    end
  end
end

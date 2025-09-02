# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextEditorCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam]
        required :content, union: -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlockParam::Content }

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
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :text_editor_code_execution_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam]
        #
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :text_editor_code_execution_tool_result]

        # @see Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam }

          variant -> { Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlockParam }

          variant -> { Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam }

          variant -> { Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam)]
        end
      end
    end

    BetaTextEditorCodeExecutionToolResultBlockParam = Beta::BetaTextEditorCodeExecutionToolResultBlockParam
  end
end

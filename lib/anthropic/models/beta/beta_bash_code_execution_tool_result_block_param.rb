# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBashCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaBashCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaBashCodeExecutionResultBlockParam]
        required :content, union: -> { Anthropic::Beta::BetaBashCodeExecutionToolResultBlockParam::Content }

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
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :bash_code_execution_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaBashCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaBashCodeExecutionResultBlockParam]
        #
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :bash_code_execution_tool_result]

        # @see Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam }

          variant -> { Anthropic::Beta::BetaBashCodeExecutionResultBlockParam }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaBashCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaBashCodeExecutionResultBlockParam)]
        end
      end
    end

    BetaBashCodeExecutionToolResultBlockParam = Beta::BetaBashCodeExecutionToolResultBlockParam
  end
end

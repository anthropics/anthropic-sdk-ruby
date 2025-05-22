# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMCPToolResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlock>]
        required :content, union: -> { Anthropic::Beta::BetaMCPToolResultBlock::Content }

        # @!attribute is_error
        #
        #   @return [Boolean]
        required :is_error, Anthropic::Internal::Type::Boolean

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :mcp_tool_result]
        required :type, const: :mcp_tool_result

        # @!method initialize(content:, is_error:, tool_use_id:, type: :mcp_tool_result)
        #   @param content [String, Array<Anthropic::Models::Beta::BetaTextBlock>]
        #   @param is_error [Boolean]
        #   @param tool_use_id [String]
        #   @param type [Symbol, :mcp_tool_result]

        # @see Anthropic::Models::Beta::BetaMCPToolResultBlock#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaMCPToolResultBlock::Content::BetaTextBlockArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlock>)]

          # @type [Anthropic::Internal::Type::Converter]
          BetaTextBlockArray = Anthropic::Internal::Type::ArrayOf[-> { Anthropic::Beta::BetaTextBlock }]
        end
      end
    end

    BetaMCPToolResultBlock = Beta::BetaMCPToolResultBlock
  end
end

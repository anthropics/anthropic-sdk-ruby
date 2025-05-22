# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRequestMCPToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :mcp_tool_result]
        required :type, const: :mcp_tool_result

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>, nil]
        optional :content, union: -> { Anthropic::Beta::BetaRequestMCPToolResultBlockParam::Content }

        # @!attribute is_error
        #
        #   @return [Boolean, nil]
        optional :is_error, Anthropic::Internal::Type::Boolean

        # @!method initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :mcp_tool_result)
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        #
        #   @param is_error [Boolean]
        #
        #   @param type [Symbol, :mcp_tool_result]

        # @see Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam::Content::BetaTextBlockParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam>)]

          # @type [Anthropic::Internal::Type::Converter]
          BetaTextBlockParamArray = Anthropic::Internal::Type::ArrayOf[-> {
            Anthropic::Beta::BetaTextBlockParam
          }]
        end
      end
    end

    BetaRequestMCPToolResultBlockParam = Beta::BetaRequestMCPToolResultBlockParam
  end
end

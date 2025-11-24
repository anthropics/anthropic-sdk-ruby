# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolSearchToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaToolSearchToolResultErrorParam, Anthropic::Models::Beta::BetaToolSearchToolSearchResultBlockParam]
        required :content, union: -> { Anthropic::Beta::BetaToolSearchToolResultBlockParam::Content }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :tool_search_tool_result]
        required :type, const: :tool_search_tool_result

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :tool_search_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaToolSearchToolResultErrorParam, Anthropic::Models::Beta::BetaToolSearchToolSearchResultBlockParam]
        #
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :tool_search_tool_result]

        # @see Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaToolSearchToolResultErrorParam }

          variant -> { Anthropic::Beta::BetaToolSearchToolSearchResultBlockParam }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaToolSearchToolResultErrorParam, Anthropic::Models::Beta::BetaToolSearchToolSearchResultBlockParam)]
        end
      end
    end

    BetaToolSearchToolResultBlockParam = Beta::BetaToolSearchToolResultBlockParam
  end
end

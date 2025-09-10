# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaWebFetchToolResultErrorBlockParam, Anthropic::Models::Beta::BetaWebFetchBlockParam]
        required :content, union: -> { Anthropic::Beta::BetaWebFetchToolResultBlockParam::Content }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :web_fetch_tool_result]
        required :type, const: :web_fetch_tool_result

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :web_fetch_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaWebFetchToolResultErrorBlockParam, Anthropic::Models::Beta::BetaWebFetchBlockParam]
        #
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :web_fetch_tool_result]

        # @see Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaWebFetchToolResultErrorBlockParam }

          variant -> { Anthropic::Beta::BetaWebFetchBlockParam }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaWebFetchToolResultErrorBlockParam, Anthropic::Models::Beta::BetaWebFetchBlockParam)]
        end
      end
    end

    BetaWebFetchToolResultBlockParam = Beta::BetaWebFetchToolResultBlockParam
  end
end

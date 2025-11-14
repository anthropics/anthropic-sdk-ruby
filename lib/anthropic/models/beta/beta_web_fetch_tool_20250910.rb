# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchTool20250910 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :web_fetch]
        required :name, const: :web_fetch

        # @!attribute type
        #
        #   @return [Symbol, :web_fetch_20250910]
        required :type, const: :web_fetch_20250910

        # @!attribute allowed_domains
        #   List of domains to allow fetching from
        #
        #   @return [Array<String>, nil]
        optional :allowed_domains, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute blocked_domains
        #   List of domains to block fetching from
        #
        #   @return [Array<String>, nil]
        optional :blocked_domains, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute citations
        #   Citations configuration for fetched documents. Citations are disabled by
        #   default.
        #
        #   @return [Anthropic::Models::Beta::BetaCitationsConfigParam, nil]
        optional :citations, -> { Anthropic::Beta::BetaCitationsConfigParam }, nil?: true

        # @!attribute max_content_tokens
        #   Maximum number of tokens used by including web page text content in the context.
        #   The limit is approximate and does not apply to binary content such as PDFs.
        #
        #   @return [Integer, nil]
        optional :max_content_tokens, Integer, nil?: true

        # @!attribute max_uses
        #   Maximum number of times the tool can be used in the API request.
        #
        #   @return [Integer, nil]
        optional :max_uses, Integer, nil?: true

        # @!attribute strict
        #
        #   @return [Boolean, nil]
        optional :strict, Anthropic::Internal::Type::Boolean

        # @!method initialize(allowed_domains: nil, blocked_domains: nil, cache_control: nil, citations: nil, max_content_tokens: nil, max_uses: nil, strict: nil, name: :web_fetch, type: :web_fetch_20250910)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaWebFetchTool20250910} for more details.
        #
        #   @param allowed_domains [Array<String>, nil] List of domains to allow fetching from
        #
        #   @param blocked_domains [Array<String>, nil] List of domains to block fetching from
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param citations [Anthropic::Models::Beta::BetaCitationsConfigParam, nil] Citations configuration for fetched documents. Citations are disabled by default
        #
        #   @param max_content_tokens [Integer, nil] Maximum number of tokens used by including web page text content in the context.
        #
        #   @param max_uses [Integer, nil] Maximum number of times the tool can be used in the API request.
        #
        #   @param strict [Boolean]
        #
        #   @param name [Symbol, :web_fetch] Name of the tool.
        #
        #   @param type [Symbol, :web_fetch_20250910]
      end
    end

    BetaWebFetchTool20250910 = Beta::BetaWebFetchTool20250910
  end
end

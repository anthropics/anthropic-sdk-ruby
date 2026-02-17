# frozen_string_literal: true

module Anthropic
  module Models
    class WebFetchTool20250910 < Anthropic::Internal::Type::BaseModel
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

      # @!attribute allowed_callers
      #
      #   @return [Array<Symbol, Anthropic::Models::WebFetchTool20250910::AllowedCaller>, nil]
      optional :allowed_callers,
               -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::WebFetchTool20250910::AllowedCaller] }

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
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute citations
      #   Citations configuration for fetched documents. Citations are disabled by
      #   default.
      #
      #   @return [Anthropic::Models::CitationsConfigParam, nil]
      optional :citations, -> { Anthropic::CitationsConfigParam }, nil?: true

      # @!attribute defer_loading
      #   If true, tool will not be included in initial system prompt. Only loaded when
      #   returned via tool_reference from tool search.
      #
      #   @return [Boolean, nil]
      optional :defer_loading, Anthropic::Internal::Type::Boolean

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
      #   When true, guarantees schema validation on tool names and inputs
      #
      #   @return [Boolean, nil]
      optional :strict, Anthropic::Internal::Type::Boolean

      # @!method initialize(allowed_callers: nil, allowed_domains: nil, blocked_domains: nil, cache_control: nil, citations: nil, defer_loading: nil, max_content_tokens: nil, max_uses: nil, strict: nil, name: :web_fetch, type: :web_fetch_20250910)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::WebFetchTool20250910} for more details.
      #
      #   @param allowed_callers [Array<Symbol, Anthropic::Models::WebFetchTool20250910::AllowedCaller>]
      #
      #   @param allowed_domains [Array<String>, nil] List of domains to allow fetching from
      #
      #   @param blocked_domains [Array<String>, nil] List of domains to block fetching from
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param citations [Anthropic::Models::CitationsConfigParam, nil] Citations configuration for fetched documents. Citations are disabled by default
      #
      #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
      #
      #   @param max_content_tokens [Integer, nil] Maximum number of tokens used by including web page text content in the context.
      #
      #   @param max_uses [Integer, nil] Maximum number of times the tool can be used in the API request.
      #
      #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
      #
      #   @param name [Symbol, :web_fetch] Name of the tool.
      #
      #   @param type [Symbol, :web_fetch_20250910]

      module AllowedCaller
        extend Anthropic::Internal::Type::Enum

        DIRECT = :direct
        CODE_EXECUTION_20250825 = :code_execution_20250825

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

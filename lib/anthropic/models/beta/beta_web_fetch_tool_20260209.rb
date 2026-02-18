# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchTool20260209 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :web_fetch]
        required :name, const: :web_fetch

        # @!attribute type
        #
        #   @return [Symbol, :web_fetch_20260209]
        required :type, const: :web_fetch_20260209

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::BetaWebFetchTool20260209::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaWebFetchTool20260209::AllowedCaller] }

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

        # @!method initialize(allowed_callers: nil, allowed_domains: nil, blocked_domains: nil, cache_control: nil, citations: nil, defer_loading: nil, max_content_tokens: nil, max_uses: nil, strict: nil, name: :web_fetch, type: :web_fetch_20260209)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaWebFetchTool20260209} for more details.
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::Beta::BetaWebFetchTool20260209::AllowedCaller>]
        #
        #   @param allowed_domains [Array<String>, nil] List of domains to allow fetching from
        #
        #   @param blocked_domains [Array<String>, nil] List of domains to block fetching from
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param citations [Anthropic::Models::Beta::BetaCitationsConfigParam, nil] Citations configuration for fetched documents. Citations are disabled by default
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
        #   @param type [Symbol, :web_fetch_20260209]

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825
          CODE_EXECUTION_20260120 = :code_execution_20260120

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaWebFetchTool20260209 = Beta::BetaWebFetchTool20260209
  end
end

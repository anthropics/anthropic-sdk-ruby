# frozen_string_literal: true

module Anthropic
  module Models
    # Code execution tool with REPL state persistence (daemon mode + gVisor
    # checkpoint).
    module ToolUnion
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::Tool }

      variant -> { Anthropic::ToolBash20250124 }

      variant -> { Anthropic::CodeExecutionTool20250522 }

      variant -> { Anthropic::CodeExecutionTool20250825 }

      # Code execution tool with REPL state persistence (daemon mode + gVisor checkpoint).
      variant -> { Anthropic::ToolUnion::CodeExecutionTool20260120 }

      variant -> { Anthropic::MemoryTool20250818 }

      variant -> { Anthropic::ToolTextEditor20250124 }

      variant -> { Anthropic::ToolTextEditor20250429 }

      variant -> { Anthropic::ToolTextEditor20250728 }

      variant -> { Anthropic::WebSearchTool20250305 }

      variant -> { Anthropic::WebFetchTool20250910 }

      variant -> { Anthropic::ToolUnion::WebSearchTool20260209 }

      variant -> { Anthropic::ToolUnion::WebFetchTool20260209 }

      variant -> { Anthropic::ToolSearchToolBm25_20251119 }

      variant -> { Anthropic::ToolSearchToolRegex20251119 }

      class CodeExecutionTool20260120 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :code_execution]
        required :name, const: :code_execution

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_20260120]
        required :type, const: :code_execution_20260120

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::ToolUnion::CodeExecutionTool20260120::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::ToolUnion::CodeExecutionTool20260120::AllowedCaller] }

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::CacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

        # @!attribute defer_loading
        #   If true, tool will not be included in initial system prompt. Only loaded when
        #   returned via tool_reference from tool search.
        #
        #   @return [Boolean, nil]
        optional :defer_loading, Anthropic::Internal::Type::Boolean

        # @!attribute strict
        #   When true, guarantees schema validation on tool names and inputs
        #
        #   @return [Boolean, nil]
        optional :strict, Anthropic::Internal::Type::Boolean

        # @!method initialize(allowed_callers: nil, cache_control: nil, defer_loading: nil, strict: nil, name: :code_execution, type: :code_execution_20260120)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::ToolUnion::CodeExecutionTool20260120} for more details.
        #
        #   Code execution tool with REPL state persistence (daemon mode + gVisor
        #   checkpoint).
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::ToolUnion::CodeExecutionTool20260120::AllowedCaller>]
        #
        #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
        #
        #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
        #
        #   @param name [Symbol, :code_execution] Name of the tool.
        #
        #   @param type [Symbol, :code_execution_20260120]

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class WebSearchTool20260209 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :web_search]
        required :name, const: :web_search

        # @!attribute type
        #
        #   @return [Symbol, :web_search_20260209]
        required :type, const: :web_search_20260209

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::ToolUnion::WebSearchTool20260209::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::ToolUnion::WebSearchTool20260209::AllowedCaller] }

        # @!attribute allowed_domains
        #   If provided, only these domains will be included in results. Cannot be used
        #   alongside `blocked_domains`.
        #
        #   @return [Array<String>, nil]
        optional :allowed_domains, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute blocked_domains
        #   If provided, these domains will never appear in results. Cannot be used
        #   alongside `allowed_domains`.
        #
        #   @return [Array<String>, nil]
        optional :blocked_domains, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::CacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

        # @!attribute defer_loading
        #   If true, tool will not be included in initial system prompt. Only loaded when
        #   returned via tool_reference from tool search.
        #
        #   @return [Boolean, nil]
        optional :defer_loading, Anthropic::Internal::Type::Boolean

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

        # @!attribute user_location
        #   Parameters for the user's location. Used to provide more relevant search
        #   results.
        #
        #   @return [Anthropic::Models::ToolUnion::WebSearchTool20260209::UserLocation, nil]
        optional :user_location, -> { Anthropic::ToolUnion::WebSearchTool20260209::UserLocation }, nil?: true

        # @!method initialize(allowed_callers: nil, allowed_domains: nil, blocked_domains: nil, cache_control: nil, defer_loading: nil, max_uses: nil, strict: nil, user_location: nil, name: :web_search, type: :web_search_20260209)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::ToolUnion::WebSearchTool20260209} for more details.
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::ToolUnion::WebSearchTool20260209::AllowedCaller>]
        #
        #   @param allowed_domains [Array<String>, nil] If provided, only these domains will be included in results. Cannot be used alon
        #
        #   @param blocked_domains [Array<String>, nil] If provided, these domains will never appear in results. Cannot be used alongsid
        #
        #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
        #
        #   @param max_uses [Integer, nil] Maximum number of times the tool can be used in the API request.
        #
        #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
        #
        #   @param user_location [Anthropic::Models::ToolUnion::WebSearchTool20260209::UserLocation, nil] Parameters for the user's location. Used to provide more relevant search results
        #
        #   @param name [Symbol, :web_search] Name of the tool.
        #
        #   @param type [Symbol, :web_search_20260209]

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Anthropic::Models::ToolUnion::WebSearchTool20260209#user_location
        class UserLocation < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :approximate]
          required :type, const: :approximate

          # @!attribute city
          #   The city of the user.
          #
          #   @return [String, nil]
          optional :city, String, nil?: true

          # @!attribute country
          #   The two letter
          #   [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
          #   user.
          #
          #   @return [String, nil]
          optional :country, String, nil?: true

          # @!attribute region
          #   The region of the user.
          #
          #   @return [String, nil]
          optional :region, String, nil?: true

          # @!attribute timezone
          #   The [IANA timezone](https://nodatime.org/TimeZones) of the user.
          #
          #   @return [String, nil]
          optional :timezone, String, nil?: true

          # @!method initialize(city: nil, country: nil, region: nil, timezone: nil, type: :approximate)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::ToolUnion::WebSearchTool20260209::UserLocation} for more
          #   details.
          #
          #   Parameters for the user's location. Used to provide more relevant search
          #   results.
          #
          #   @param city [String, nil] The city of the user.
          #
          #   @param country [String, nil] The two letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha
          #
          #   @param region [String, nil] The region of the user.
          #
          #   @param timezone [String, nil] The [IANA timezone](https://nodatime.org/TimeZones) of the user.
          #
          #   @param type [Symbol, :approximate]
        end
      end

      class WebFetchTool20260209 < Anthropic::Internal::Type::BaseModel
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
        #   @return [Array<Symbol, Anthropic::Models::ToolUnion::WebFetchTool20260209::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::ToolUnion::WebFetchTool20260209::AllowedCaller] }

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

        # @!method initialize(allowed_callers: nil, allowed_domains: nil, blocked_domains: nil, cache_control: nil, citations: nil, defer_loading: nil, max_content_tokens: nil, max_uses: nil, strict: nil, name: :web_fetch, type: :web_fetch_20260209)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::ToolUnion::WebFetchTool20260209} for more details.
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::ToolUnion::WebFetchTool20260209::AllowedCaller>]
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
        #   @param type [Symbol, :web_fetch_20260209]

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::ToolUnion::CodeExecutionTool20260120, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::ToolUnion::WebSearchTool20260209, Anthropic::Models::ToolUnion::WebFetchTool20260209, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119)]
    end
  end
end

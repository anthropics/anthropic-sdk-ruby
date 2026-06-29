# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebSearchTool20260318 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :web_search]
        required :name, const: :web_search

        # @!attribute type
        #
        #   @return [Symbol, :web_search_20260318]
        required :type, const: :web_search_20260318

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::BetaWebSearchTool20260318::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaWebSearchTool20260318::AllowedCaller] }

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
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

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

        # @!attribute response_inclusion
        #   How this tool's result blocks appear in the API response when the result was
        #   consumed by a completed code_execution call in the same turn. 'full' returns the
        #   complete content (default). 'excluded' drops the nested server_tool_use and
        #   result block pair entirely. Results from direct calls, or from code_execution
        #   calls that paused before completing, are always returned in full so they can be
        #   sent back on the next turn.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaWebSearchTool20260318::ResponseInclusion, nil]
        optional :response_inclusion, enum: -> { Anthropic::Beta::BetaWebSearchTool20260318::ResponseInclusion }

        # @!attribute strict
        #   When true, guarantees schema validation on tool names and inputs
        #
        #   @return [Boolean, nil]
        optional :strict, Anthropic::Internal::Type::Boolean

        # @!attribute user_location
        #   Parameters for the user's location. Used to provide more relevant search
        #   results.
        #
        #   @return [Anthropic::Models::Beta::BetaUserLocation, nil]
        optional :user_location, -> { Anthropic::Beta::BetaUserLocation }, nil?: true

        # @!method initialize(allowed_callers: nil, allowed_domains: nil, blocked_domains: nil, cache_control: nil, defer_loading: nil, max_uses: nil, response_inclusion: nil, strict: nil, user_location: nil, name: :web_search, type: :web_search_20260318)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaWebSearchTool20260318} for more details.
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::Beta::BetaWebSearchTool20260318::AllowedCaller>]
        #
        #   @param allowed_domains [Array<String>, nil] If provided, only these domains will be included in results. Cannot be used alon
        #
        #   @param blocked_domains [Array<String>, nil] If provided, these domains will never appear in results. Cannot be used alongsid
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
        #
        #   @param max_uses [Integer, nil] Maximum number of times the tool can be used in the API request.
        #
        #   @param response_inclusion [Symbol, Anthropic::Models::Beta::BetaWebSearchTool20260318::ResponseInclusion] How this tool's result blocks appear in the API response when the result was con
        #
        #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
        #
        #   @param user_location [Anthropic::Models::Beta::BetaUserLocation, nil] Parameters for the user's location. Used to provide more relevant search results
        #
        #   @param name [Symbol, :web_search] Name of the tool.
        #
        #   @param type [Symbol, :web_search_20260318]

        # Specifies who can invoke a tool.
        #
        # Values: direct: The model can call this tool directly. code_execution_20250825:
        # The tool can be called from the code execution environment (v1).
        # code_execution_20260120: The tool can be called from the code execution
        # environment (v2 with persistence). code_execution_20260521: The tool can be
        # called from the code execution environment (v2 with persistence).
        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825
          CODE_EXECUTION_20260120 = :code_execution_20260120
          CODE_EXECUTION_20260521 = :code_execution_20260521

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # How this tool's result blocks appear in the API response when the result was
        # consumed by a completed code_execution call in the same turn. 'full' returns the
        # complete content (default). 'excluded' drops the nested server_tool_use and
        # result block pair entirely. Results from direct calls, or from code_execution
        # calls that paused before completing, are always returned in full so they can be
        # sent back on the next turn.
        #
        # @see Anthropic::Models::Beta::BetaWebSearchTool20260318#response_inclusion
        module ResponseInclusion
          extend Anthropic::Internal::Type::Enum

          FULL = :full
          EXCLUDED = :excluded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaWebSearchTool20260318 = Beta::BetaWebSearchTool20260318
  end
end

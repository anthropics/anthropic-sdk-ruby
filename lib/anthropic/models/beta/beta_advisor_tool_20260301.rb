# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorTool20260301 < Anthropic::Internal::Type::BaseModel
        # @!attribute model
        #   The model that will complete your prompt.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Model]
        required :model, union: -> { Anthropic::Model }

        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :advisor]
        required :name, const: :advisor

        # @!attribute type
        #
        #   @return [Symbol, :advisor_20260301]
        required :type, const: :advisor_20260301

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::BetaAdvisorTool20260301::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller] }

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute caching
        #   Caching for the advisor's own prompt. When set, each advisor call writes a cache
        #   entry at the given TTL so subsequent calls in the same conversation read the
        #   stable prefix. When omitted, the advisor prompt is not cached.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :caching, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

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

        # @!method initialize(model:, allowed_callers: nil, cache_control: nil, caching: nil, defer_loading: nil, max_uses: nil, strict: nil, name: :advisor, type: :advisor_20260301)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaAdvisorTool20260301} for more details.
        #
        #   @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::Beta::BetaAdvisorTool20260301::AllowedCaller>]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param caching [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Caching for the advisor's own prompt. When set, each advisor call writes a cache
        #
        #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
        #
        #   @param max_uses [Integer, nil] Maximum number of times the tool can be used in the API request.
        #
        #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
        #
        #   @param name [Symbol, :advisor] Name of the tool.
        #
        #   @param type [Symbol, :advisor_20260301]

        # Specifies who can invoke a tool.
        #
        # Values: direct: The model can call this tool directly. code_execution_20250825:
        # The tool can be called from the code execution environment (v1).
        # code_execution_20260120: The tool can be called from the code execution
        # environment (v2 with persistence).
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

    BetaAdvisorTool20260301 = Beta::BetaAdvisorTool20260301
  end
end

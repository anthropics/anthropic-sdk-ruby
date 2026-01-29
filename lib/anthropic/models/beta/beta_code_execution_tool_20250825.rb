# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCodeExecutionTool20250825 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :code_execution]
        required :name, const: :code_execution

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_20250825]
        required :type, const: :code_execution_20250825

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::BetaCodeExecutionTool20250825::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaCodeExecutionTool20250825::AllowedCaller] }

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

        # @!attribute strict
        #   When true, guarantees schema validation on tool names and inputs
        #
        #   @return [Boolean, nil]
        optional :strict, Anthropic::Internal::Type::Boolean

        # @!method initialize(allowed_callers: nil, cache_control: nil, defer_loading: nil, strict: nil, name: :code_execution, type: :code_execution_20250825)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCodeExecutionTool20250825} for more details.
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::Beta::BetaCodeExecutionTool20250825::AllowedCaller>]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
        #
        #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
        #
        #   @param name [Symbol, :code_execution] Name of the tool.
        #
        #   @param type [Symbol, :code_execution_20250825]

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaCodeExecutionTool20250825 = Beta::BetaCodeExecutionTool20250825
  end
end

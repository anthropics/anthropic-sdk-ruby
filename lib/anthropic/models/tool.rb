# frozen_string_literal: true

module Anthropic
  module Models
    class Tool < Anthropic::Internal::Type::BaseModel
      # @!attribute input_schema
      #   [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
      #
      #   This defines the shape of the `input` that your tool accepts and that the model
      #   will produce.
      #
      #   @return [Anthropic::Models::Tool::InputSchema]
      required :input_schema, -> { Anthropic::Tool::InputSchema }

      # @!attribute name
      #   Name of the tool.
      #
      #   This is how the tool will be called by the model and in `tool_use` blocks.
      #
      #   @return [String]
      required :name, String

      # @!attribute allowed_callers
      #
      #   @return [Array<Symbol, Anthropic::Models::Tool::AllowedCaller>, nil]
      optional :allowed_callers, -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Tool::AllowedCaller] }

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

      # @!attribute description
      #   Description of what this tool does.
      #
      #   Tool descriptions should be as detailed as possible. The more information that
      #   the model has about what the tool is and how to use it, the better it will
      #   perform. You can use natural language descriptions to reinforce important
      #   aspects of the tool input JSON schema.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute eager_input_streaming
      #   Enable eager input streaming for this tool. When true, tool input parameters
      #   will be streamed incrementally as they are generated, and types will be inferred
      #   on-the-fly rather than buffering the full JSON output. When false, streaming is
      #   disabled for this tool even if the fine-grained-tool-streaming beta is active.
      #   When null (default), uses the default behavior based on beta headers.
      #
      #   @return [Boolean, nil]
      optional :eager_input_streaming, Anthropic::Internal::Type::Boolean, nil?: true

      # @!attribute input_examples
      #
      #   @return [Array<Hash{Symbol=>Object}>, nil]
      optional :input_examples,
               Anthropic::Internal::Type::ArrayOf[Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]]

      # @!attribute strict
      #   When true, guarantees schema validation on tool names and inputs
      #
      #   @return [Boolean, nil]
      optional :strict, Anthropic::Internal::Type::Boolean

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::Tool::Type, nil]
      optional :type, enum: -> { Anthropic::Tool::Type }, nil?: true

      # @!method initialize(input_schema:, name:, allowed_callers: nil, cache_control: nil, defer_loading: nil, description: nil, eager_input_streaming: nil, input_examples: nil, strict: nil, type: nil)
      #   Some parameter documentations has been truncated, see {Anthropic::Models::Tool}
      #   for more details.
      #
      #   @param input_schema [Anthropic::Models::Tool::InputSchema] [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
      #
      #   @param name [String] Name of the tool.
      #
      #   @param allowed_callers [Array<Symbol, Anthropic::Models::Tool::AllowedCaller>]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
      #
      #   @param description [String] Description of what this tool does.
      #
      #   @param eager_input_streaming [Boolean, nil] Enable eager input streaming for this tool. When true, tool input parameters wil
      #
      #   @param input_examples [Array<Hash{Symbol=>Object}>]
      #
      #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
      #
      #   @param type [Symbol, Anthropic::Models::Tool::Type, nil]

      # @see Anthropic::Models::Tool#input_schema
      class InputSchema < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :object]
        required :type, const: :object

        # @!attribute properties
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :properties,
                 Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown],
                 nil?: true

        # @!attribute required
        #
        #   @return [Array<String>, nil]
        optional :required, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!method initialize(properties: nil, required: nil, type: :object)
        #   [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
        #
        #   This defines the shape of the `input` that your tool accepts and that the model
        #   will produce.
        #
        #   @param properties [Hash{Symbol=>Object}, nil]
        #   @param required [Array<String>, nil]
        #   @param type [Symbol, :object]
      end

      module AllowedCaller
        extend Anthropic::Internal::Type::Enum

        DIRECT = :direct
        CODE_EXECUTION_20250825 = :code_execution_20250825

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Anthropic::Models::Tool#type
      module Type
        extend Anthropic::Internal::Type::Enum

        CUSTOM = :custom

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

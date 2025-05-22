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

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

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

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::Tool::Type, nil]
      optional :type, enum: -> { Anthropic::Tool::Type }, nil?: true

      # @!method initialize(input_schema:, name:, cache_control: nil, description: nil, type: nil)
      #   Some parameter documentations has been truncated, see {Anthropic::Models::Tool}
      #   for more details.
      #
      #   @param input_schema [Anthropic::Models::Tool::InputSchema] [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
      #
      #   @param name [String] Name of the tool.
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param description [String] Description of what this tool does.
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
        #   @return [Object, nil]
        optional :properties, Anthropic::Internal::Type::Unknown, nil?: true

        # @!method initialize(properties: nil, type: :object)
        #   [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
        #
        #   This defines the shape of the `input` that your tool accepts and that the model
        #   will produce.
        #
        #   @param properties [Object, nil]
        #   @param type [Symbol, :object]
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

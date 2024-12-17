# frozen_string_literal: true

module Anthropic
  module Models
    class Tool < Anthropic::BaseModel
      # @!attribute input_schema
      #   [JSON schema](https://json-schema.org/) for this tool's input.
      #
      # This defines the shape of the `input` that your tool accepts and that the model will produce.
      #
      #   @return [Anthropic::Models::Tool::InputSchema]
      required :input_schema, -> { Anthropic::Models::Tool::InputSchema }

      # @!attribute name
      #   Name of the tool.
      #
      # This is how the tool will be called by the model and in tool_use blocks.
      #
      #   @return [String]
      required :name, String

      # @!attribute description
      #   Description of what this tool does.
      #
      # Tool descriptions should be as detailed as possible. The more information that the model has about what the tool is and how to use it, the better it will perform. You can use natural language descriptions to reinforce important aspects of the tool input JSON schema.
      #
      #   @return [String]
      optional :description, String

      # @!parse
      #   # @param input_schema [Anthropic::Models::Tool::InputSchema] [JSON schema](https://json-schema.org/) for this tool's input.
      #   #
      #   #   This defines the shape of the `input` that your tool accepts and that the model
      #   #   will produce.
      #   #
      #   # @param name [String] Name of the tool.
      #   #
      #   #   This is how the tool will be called by the model and in tool_use blocks.
      #   #
      #   # @param description [String, nil] Description of what this tool does.
      #   #
      #   #   Tool descriptions should be as detailed as possible. The more information that
      #   #   the model has about what the tool is and how to use it, the better it will
      #   #   perform. You can use natural language descriptions to reinforce important
      #   #   aspects of the tool input JSON schema.
      #   #
      #   def initialize(input_schema:, name:, description: nil) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class InputSchema < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Tool::InputSchema::Type]
        required :type, enum: -> { Anthropic::Models::Tool::InputSchema::Type }

        # @!attribute properties
        #
        #   @return [Object]
        optional :properties, Anthropic::Unknown

        # @!parse
        #   # [JSON schema](https://json-schema.org/) for this tool's input.
        #   #
        #   #   This defines the shape of the `input` that your tool accepts and that the model
        #   #   will produce.
        #   #
        #   # @param type [String]
        #   # @param properties [Object, nil]
        #   #
        #   def initialize(type:, properties: nil) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :object
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          OBJECT = :object
        end
      end
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    class BetaTool < BaseModel
      # @!attribute [rw] input_schema
      #   [JSON schema](https://json-schema.org/) for this tool's input.
      #
      # This defines the shape of the `input` that your tool accepts and that the model will produce.
      #   @return [Anthropic::Models::BetaTool::InputSchema]
      required :input_schema, -> { Anthropic::Models::BetaTool::InputSchema }

      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      # @!attribute [rw] description
      #   Description of what this tool does.
      #
      # Tool descriptions should be as detailed as possible. The more information that the model has about what the tool is and how to use it, the better it will perform. You can use natural language descriptions to reinforce important aspects of the tool input JSON schema.
      #   @return [String]
      optional :description, String

      class InputSchema < BaseModel
        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::BetaTool::InputSchema::Type]
        required :type, enum: -> { Anthropic::Models::BetaTool::InputSchema::Type }

        # @!attribute [rw] properties
        #   @return [Object]
        optional :properties, Anthropic::Unknown

        class Type < Anthropic::Enum
          OBJECT = :object
        end

        # Create a new instance of InputSchema from a Hash of raw data.
        #
        # @overload initialize(type: nil, properties: nil)
        # @param type [String]
        # @param properties [Object]
        def initialize(data = {})
          super
        end
      end

      # Create a new instance of BetaTool from a Hash of raw data.
      #
      # @overload initialize(input_schema: nil, name: nil, cache_control: nil, description: nil)
      # @param input_schema [Object] [JSON schema](https://json-schema.org/) for this tool's input.
      #
      #   This defines the shape of the `input` that your tool accepts and that the model
      #   will produce.
      # @param name [String]
      # @param cache_control [Object]
      # @param description [String] Description of what this tool does.
      #
      #   Tool descriptions should be as detailed as possible. The more information that
      #   the model has about what the tool is and how to use it, the better it will
      #   perform. You can use natural language descriptions to reinforce important
      #   aspects of the tool input JSON schema.
      def initialize(data = {})
        super
      end
    end
  end
end

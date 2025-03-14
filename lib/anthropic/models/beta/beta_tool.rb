# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTool < Anthropic::BaseModel
        # @!attribute input_schema
        #   [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
        #
        #     This defines the shape of the `input` that your tool accepts and that the model
        #     will produce.
        #
        #   @return [Anthropic::Models::Beta::BetaTool::InputSchema]
        required :input_schema, -> { Anthropic::Models::Beta::BetaTool::InputSchema }

        # @!attribute name
        #   Name of the tool.
        #
        #     This is how the tool will be called by the model and in tool_use blocks.
        #
        #   @return [String]
        required :name, String

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute [r] description
        #   Description of what this tool does.
        #
        #     Tool descriptions should be as detailed as possible. The more information that
        #     the model has about what the tool is and how to use it, the better it will
        #     perform. You can use natural language descriptions to reinforce important
        #     aspects of the tool input JSON schema.
        #
        #   @return [String, nil]
        optional :description, String

        # @!parse
        #   # @return [String]
        #   attr_writer :description

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaTool::Type, nil]
        optional :type, enum: -> { Anthropic::Models::Beta::BetaTool::Type }, nil?: true

        # @!parse
        #   # @param input_schema [Anthropic::Models::Beta::BetaTool::InputSchema]
        #   # @param name [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param description [String]
        #   # @param type [Symbol, Anthropic::Models::Beta::BetaTool::Type, nil]
        #   #
        #   def initialize(input_schema:, name:, cache_control: nil, description: nil, type: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        class InputSchema < Anthropic::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :object]
          required :type, const: :object

          # @!attribute properties
          #
          #   @return [Object, nil]
          optional :properties, Anthropic::Unknown, nil?: true

          # @!parse
          #   # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #   #
          #   #   This defines the shape of the `input` that your tool accepts and that the model
          #   #   will produce.
          #   #
          #   # @param properties [Object, nil]
          #   # @param type [Symbol, :object]
          #   #
          #   def initialize(properties: nil, type: :object, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end

        # @abstract
        class Type < Anthropic::Enum
          CUSTOM = :custom

          finalize!
        end
      end
    end

    BetaTool = Beta::BetaTool
  end
end

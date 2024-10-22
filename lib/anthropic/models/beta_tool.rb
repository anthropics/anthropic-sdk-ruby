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
      required :name_, String, api_name: :name

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      # @!attribute [rw] description
      #   Description of what this tool does.
      #
      # Tool descriptions should be as detailed as possible. The more information that the model has about what the tool is and how to use it, the better it will perform. You can use natural language descriptions to reinforce important aspects of the tool input JSON schema.
      #   @return [String]
      optional :description, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaTool::Type]
      optional :type, enum: -> { Anthropic::Models::BetaTool::Type }

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

        # @!parse
        #   # Create a new instance of InputSchema from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :type
        #   #   @option data [Object, nil] :properties
        #   def initialize(data = {}) = super
      end

      class Type < Anthropic::Enum
        CUSTOM = :custom
      end

      # @!parse
      #   # Create a new instance of BetaTool from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object] :input_schema [JSON schema](https://json-schema.org/) for this tool's input.
      #   #
      #   #     This defines the shape of the `input` that your tool accepts and that the model
      #   #     will produce.
      #   #   @option data [String] :name
      #   #   @option data [Object, nil] :cache_control
      #   #   @option data [String, nil] :description Description of what this tool does.
      #   #
      #   #     Tool descriptions should be as detailed as possible. The more information that
      #   #     the model has about what the tool is and how to use it, the better it will
      #   #     perform. You can use natural language descriptions to reinforce important
      #   #     aspects of the tool input JSON schema.
      #   #   @option data [String, nil] :type
      #   def initialize(data = {}) = super
    end
  end
end

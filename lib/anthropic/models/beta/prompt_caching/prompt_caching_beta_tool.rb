# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaTool < Anthropic::BaseModel
          # @!attribute input_schema
          #   [JSON schema](https://json-schema.org/) for this tool's input.
          #
          # This defines the shape of the `input` that your tool accepts and that the model will produce.
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTool::InputSchema]
          required :input_schema,
                   -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTool::InputSchema
                   }

          # @!attribute name
          #   Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          #   @return [String]
          required :name, String

          # @!attribute cache_control
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral]
          optional :cache_control,
                   -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral }

          # @!attribute description
          #   Description of what this tool does.
          #
          # Tool descriptions should be as detailed as possible. The more information that the model has about what the tool is and how to use it, the better it will perform. You can use natural language descriptions to reinforce important aspects of the tool input JSON schema.
          #   @return [String]
          optional :description, String

          class InputSchema < Anthropic::BaseModel
            # @!attribute type
            #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTool::InputSchema::Type]
            required :type,
                     enum: -> {
                       Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTool::InputSchema::Type
                     }

            # @!attribute properties
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

          # @!parse
          #   # Create a new instance of PromptCachingBetaTool from a Hash of raw data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [Object] :input_schema [JSON schema](https://json-schema.org/) for this tool's input.
          #   #
          #   #     This defines the shape of the `input` that your tool accepts and that the model
          #   #     will produce.
          #   #   @option data [String] :name Name of the tool.
          #   #
          #   #     This is how the tool will be called by the model and in tool_use blocks.
          #   #   @option data [Object, nil] :cache_control
          #   #   @option data [String, nil] :description Description of what this tool does.
          #   #
          #   #     Tool descriptions should be as detailed as possible. The more information that
          #   #     the model has about what the tool is and how to use it, the better it will
          #   #     perform. You can use natural language descriptions to reinforce important
          #   #     aspects of the tool input JSON schema.
          #   def initialize(data = {}) = super
        end
      end

      PromptCachingBetaTool = PromptCaching::PromptCachingBetaTool
    end
  end
end

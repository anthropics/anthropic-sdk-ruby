# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaTool < BaseModel
      # @!attribute [rw] input_schema
      #   [JSON schema](https://json-schema.org/) for this tool's input.
      #
      # This defines the shape of the `input` that your tool accepts and that the model will produce.
      #   @return [Anthropic::Models::PromptCachingBetaTool::InputSchema]
      required :input_schema, -> { Anthropic::Models::PromptCachingBetaTool::InputSchema }

      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::PromptCachingBetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::PromptCachingBetaCacheControlEphemeral }

      # @!attribute [rw] description
      #   Description of what this tool does.
      #
      # Tool descriptions should be as detailed as possible. The more information that the model has about what the tool is and how to use it, the better it will perform. You can use natural language descriptions to reinforce important aspects of the tool input JSON schema.
      #   @return [String]
      optional :description, String

      class InputSchema < BaseModel
        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::PromptCachingBetaTool::InputSchema::Type]
        required :type, enum: -> { Anthropic::Models::PromptCachingBetaTool::InputSchema::Type }

        # @!attribute [rw] properties
        #   @return [Object]
        optional :properties, Anthropic::Unknown

        class Type < Anthropic::Enum
          OBJECT = :object
        end
      end
    end
  end
end

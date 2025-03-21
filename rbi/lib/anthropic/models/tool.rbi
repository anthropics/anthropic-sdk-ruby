# typed: strong

module Anthropic
  module Models
    class Tool < Anthropic::BaseModel
      # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
      #
      #   This defines the shape of the `input` that your tool accepts and that the model
      #   will produce.
      sig { returns(Anthropic::Models::Tool::InputSchema) }
      attr_reader :input_schema

      sig { params(input_schema: T.any(Anthropic::Models::Tool::InputSchema, Anthropic::Util::AnyHash)).void }
      attr_writer :input_schema

      # Name of the tool.
      #
      #   This is how the tool will be called by the model and in tool_use blocks.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash))
        )
          .void
      end
      attr_writer :cache_control

      # Description of what this tool does.
      #
      #   Tool descriptions should be as detailed as possible. The more information that
      #   the model has about what the tool is and how to use it, the better it will
      #   perform. You can use natural language descriptions to reinforce important
      #   aspects of the tool input JSON schema.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        params(
          input_schema: T.any(Anthropic::Models::Tool::InputSchema, Anthropic::Util::AnyHash),
          name: String,
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)),
          description: String
        )
          .returns(T.attached_class)
      end
      def self.new(input_schema:, name:, cache_control: nil, description: nil)
      end

      sig do
        override
          .returns(
            {
              input_schema: Anthropic::Models::Tool::InputSchema,
              name: String,
              cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
              description: String
            }
          )
      end
      def to_hash
      end

      class InputSchema < Anthropic::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(T.anything)) }
        attr_accessor :properties

        # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
        #
        #   This defines the shape of the `input` that your tool accepts and that the model
        #   will produce.
        sig { params(properties: T.nilable(T.anything), type: Symbol).returns(T.attached_class) }
        def self.new(properties: nil, type: :object)
        end

        sig { override.returns({type: Symbol, properties: T.nilable(T.anything)}) }
        def to_hash
        end
      end
    end
  end
end

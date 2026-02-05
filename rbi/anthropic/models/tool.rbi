# typed: strong

module Anthropic
  module Models
    class Tool < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Anthropic::Tool, Anthropic::Internal::AnyHash) }

      # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
      #
      # This defines the shape of the `input` that your tool accepts and that the model
      # will produce.
      sig { returns(Anthropic::Tool::InputSchema) }
      attr_reader :input_schema

      sig { params(input_schema: Anthropic::Tool::InputSchema::OrHash).void }
      attr_writer :input_schema

      # Name of the tool.
      #
      # This is how the tool will be called by the model and in `tool_use` blocks.
      sig { returns(String) }
      attr_accessor :name

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # Description of what this tool does.
      #
      # Tool descriptions should be as detailed as possible. The more information that
      # the model has about what the tool is and how to use it, the better it will
      # perform. You can use natural language descriptions to reinforce important
      # aspects of the tool input JSON schema.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Enable eager input streaming for this tool. When true, tool input parameters
      # will be streamed incrementally as they are generated, and types will be inferred
      # on-the-fly rather than buffering the full JSON output. When false, streaming is
      # disabled for this tool even if the fine-grained-tool-streaming beta is active.
      # When null (default), uses the default behavior based on beta headers.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :eager_input_streaming

      # When true, guarantees schema validation on tool names and inputs
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :strict

      sig { params(strict: T::Boolean).void }
      attr_writer :strict

      sig { returns(T.nilable(Anthropic::Tool::Type::OrSymbol)) }
      attr_accessor :type

      sig do
        params(
          input_schema: Anthropic::Tool::InputSchema::OrHash,
          name: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          description: String,
          eager_input_streaming: T.nilable(T::Boolean),
          strict: T::Boolean,
          type: T.nilable(Anthropic::Tool::Type::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
        #
        # This defines the shape of the `input` that your tool accepts and that the model
        # will produce.
        input_schema:,
        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        name:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # Description of what this tool does.
        #
        # Tool descriptions should be as detailed as possible. The more information that
        # the model has about what the tool is and how to use it, the better it will
        # perform. You can use natural language descriptions to reinforce important
        # aspects of the tool input JSON schema.
        description: nil,
        # Enable eager input streaming for this tool. When true, tool input parameters
        # will be streamed incrementally as they are generated, and types will be inferred
        # on-the-fly rather than buffering the full JSON output. When false, streaming is
        # disabled for this tool even if the fine-grained-tool-streaming beta is active.
        # When null (default), uses the default behavior based on beta headers.
        eager_input_streaming: nil,
        # When true, guarantees schema validation on tool names and inputs
        strict: nil,
        type: nil
      )
      end

      sig do
        override.returns(
          {
            input_schema: Anthropic::Tool::InputSchema,
            name: String,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            description: String,
            eager_input_streaming: T.nilable(T::Boolean),
            strict: T::Boolean,
            type: T.nilable(Anthropic::Tool::Type::OrSymbol)
          }
        )
      end
      def to_hash
      end

      class InputSchema < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Tool::InputSchema, Anthropic::Internal::AnyHash)
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :properties

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :required

        # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
        #
        # This defines the shape of the `input` that your tool accepts and that the model
        # will produce.
        sig do
          params(
            properties: T.nilable(T::Hash[Symbol, T.anything]),
            required: T.nilable(T::Array[String]),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(properties: nil, required: nil, type: :object)
        end

        sig do
          override.returns(
            {
              type: Symbol,
              properties: T.nilable(T::Hash[Symbol, T.anything]),
              required: T.nilable(T::Array[String])
            }
          )
        end
        def to_hash
        end
      end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Tool::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CUSTOM = T.let(:custom, Anthropic::Tool::Type::TaggedSymbol)

        sig { override.returns(T::Array[Anthropic::Tool::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end

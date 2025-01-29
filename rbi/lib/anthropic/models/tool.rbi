# typed: strong

module Anthropic
  module Models
    class Tool < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          input_schema: Anthropic::Models::Tool::InputSchema,
          name: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          description: String
        }
      end

      sig { returns(Anthropic::Models::Tool::InputSchema) }
      attr_accessor :input_schema

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_accessor :cache_control

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        params(
          input_schema: Anthropic::Models::Tool::InputSchema,
          name: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          description: String
        ).void
      end
      def initialize(input_schema:, name:, cache_control: nil, description: nil); end

      sig { returns(Anthropic::Models::Tool::Shape) }
      def to_h; end

      class InputSchema < Anthropic::BaseModel
        Shape = T.type_alias { {type: Symbol, properties: T.nilable(T.anything)} }

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(T.anything)) }
        attr_accessor :properties

        sig { params(properties: T.nilable(T.anything), type: Symbol).void }
        def initialize(properties: nil, type: :object); end

        sig { returns(Anthropic::Models::Tool::InputSchema::Shape) }
        def to_h; end
      end
    end
  end
end

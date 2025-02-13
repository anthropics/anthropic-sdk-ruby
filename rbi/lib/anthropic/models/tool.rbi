# typed: strong

module Anthropic
  module Models
    class Tool < Anthropic::BaseModel
      sig { returns(Anthropic::Models::Tool::InputSchema) }
      def input_schema
      end

      sig { params(_: Anthropic::Models::Tool::InputSchema).returns(Anthropic::Models::Tool::InputSchema) }
      def input_schema=(_)
      end

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      def cache_control
      end

      sig do
        params(_: T.nilable(Anthropic::Models::CacheControlEphemeral)).returns(T.nilable(Anthropic::Models::CacheControlEphemeral))
      end
      def cache_control=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: String).returns(String) }
      def description=(_)
      end

      sig do
        params(
          input_schema: Anthropic::Models::Tool::InputSchema,
          name: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          description: String
        ).void
      end
      def initialize(input_schema:, name:, cache_control: nil, description: nil)
      end

      sig do
        override.returns(
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
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(T.nilable(T.anything)) }
        def properties
        end

        sig { params(_: T.nilable(T.anything)).returns(T.nilable(T.anything)) }
        def properties=(_)
        end

        sig { params(properties: T.nilable(T.anything), type: Symbol).void }
        def initialize(properties: nil, type: :object)
        end

        sig { override.returns({type: Symbol, properties: T.nilable(T.anything)}) }
        def to_hash
        end
      end
    end
  end
end

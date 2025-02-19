# typed: strong

module Anthropic
  module Models
    class ToolUseBlockParam < Anthropic::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(T.anything) }
      def input
      end

      sig { params(_: T.anything).returns(T.anything) }
      def input=(_)
      end

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      def cache_control
      end

      sig do
        params(_: T.nilable(Anthropic::Models::CacheControlEphemeral))
          .returns(T.nilable(Anthropic::Models::CacheControlEphemeral))
      end
      def cache_control=(_)
      end

      sig do
        params(
          id: String,
          input: T.anything,
          name: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          type: Symbol
        )
          .void
      end
      def initialize(id:, input:, name:, cache_control: nil, type: :tool_use)
      end

      sig do
        override
          .returns(
            {
              id: String,
              input: T.anything,
              name: String,
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral)
            }
          )
      end
      def to_hash
      end
    end
  end
end

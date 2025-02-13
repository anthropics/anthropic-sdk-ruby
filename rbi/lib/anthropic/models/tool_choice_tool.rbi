# typed: strong

module Anthropic
  module Models
    class ToolChoiceTool < Anthropic::BaseModel
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

      sig { returns(T.nilable(T::Boolean)) }
      def disable_parallel_tool_use
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def disable_parallel_tool_use=(_)
      end

      sig { params(name: String, disable_parallel_tool_use: T::Boolean, type: Symbol).void }
      def initialize(name:, disable_parallel_tool_use: nil, type: :tool)
      end

      sig { override.returns({name: String, type: Symbol, disable_parallel_tool_use: T::Boolean}) }
      def to_hash
      end
    end
  end
end

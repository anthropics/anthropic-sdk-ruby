# typed: strong

module Anthropic
  module Models
    class ToolChoiceTool < Anthropic::BaseModel
      Shape = T.type_alias { {name: String, type: Symbol, disable_parallel_tool_use: T::Boolean} }

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disable_parallel_tool_use

      sig { params(disable_parallel_tool_use: T::Boolean).void }
      attr_writer :disable_parallel_tool_use

      sig { params(name: String, disable_parallel_tool_use: T::Boolean, type: Symbol).void }
      def initialize(name:, disable_parallel_tool_use: nil, type: :tool); end

      sig { returns(Anthropic::Models::ToolChoiceTool::Shape) }
      def to_h; end
    end
  end
end

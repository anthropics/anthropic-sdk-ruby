# typed: strong

module Anthropic
  module Models
    class ToolUseBlock < Anthropic::BaseModel
      Shape = T.type_alias { {id: String, input: T.anything, name: String, type: Symbol} }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.anything) }
      attr_accessor :input

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(id: String, input: T.anything, name: String, type: Symbol).void }
      def initialize(id:, input:, name:, type: :tool_use); end

      sig { returns(Anthropic::Models::ToolUseBlock::Shape) }
      def to_h; end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    class ToolUseBlock < Anthropic::Internal::Type::BaseModel
      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.anything) }
      attr_accessor :input

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(id: String, input: T.anything, name: String, type: Symbol).returns(T.attached_class) }
      def self.new(id:, input:, name:, type: :tool_use)
      end

      sig { override.returns({id: String, input: T.anything, name: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end

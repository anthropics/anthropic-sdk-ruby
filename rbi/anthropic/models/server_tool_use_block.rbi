# typed: strong

module Anthropic
  module Models
    class ServerToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ServerToolUseBlock, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.anything) }
      attr_accessor :input

      sig { returns(Symbol) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          input: T.anything,
          name: Symbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(id:, input:, name: :web_search, type: :server_tool_use)
      end

      sig do
        override.returns(
          { id: String, input: T.anything, name: Symbol, type: Symbol }
        )
      end
      def to_hash
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    class ServerToolCaller20260120 < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ServerToolCaller20260120,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :tool_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(tool_id: String, type: Symbol).returns(T.attached_class) }
      def self.new(tool_id:, type: :code_execution_20260120)
      end

      sig { override.returns({ tool_id: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end

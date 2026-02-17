# typed: strong

module Anthropic
  module Models
    class ToolReferenceBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ToolReferenceBlock, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :tool_name

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(tool_name: String, type: Symbol).returns(T.attached_class) }
      def self.new(tool_name:, type: :tool_reference)
      end

      sig { override.returns({ tool_name: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end

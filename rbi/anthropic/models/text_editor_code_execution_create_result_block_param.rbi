# typed: strong

module Anthropic
  module Models
    class TextEditorCodeExecutionCreateResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::TextEditorCodeExecutionCreateResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :is_file_update

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(is_file_update: T::Boolean, type: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(
        is_file_update:,
        type: :text_editor_code_execution_create_result
      )
      end

      sig { override.returns({ is_file_update: T::Boolean, type: Symbol }) }
      def to_hash
      end
    end
  end
end

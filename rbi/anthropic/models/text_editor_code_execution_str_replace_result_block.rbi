# typed: strong

module Anthropic
  module Models
    class TextEditorCodeExecutionStrReplaceResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::TextEditorCodeExecutionStrReplaceResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :lines

      sig { returns(T.nilable(Integer)) }
      attr_accessor :new_lines

      sig { returns(T.nilable(Integer)) }
      attr_accessor :new_start

      sig { returns(T.nilable(Integer)) }
      attr_accessor :old_lines

      sig { returns(T.nilable(Integer)) }
      attr_accessor :old_start

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          lines: T.nilable(T::Array[String]),
          new_lines: T.nilable(Integer),
          new_start: T.nilable(Integer),
          old_lines: T.nilable(Integer),
          old_start: T.nilable(Integer),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        lines:,
        new_lines:,
        new_start:,
        old_lines:,
        old_start:,
        type: :text_editor_code_execution_str_replace_result
      )
      end

      sig do
        override.returns(
          {
            lines: T.nilable(T::Array[String]),
            new_lines: T.nilable(Integer),
            new_start: T.nilable(Integer),
            old_lines: T.nilable(Integer),
            old_start: T.nilable(Integer),
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end

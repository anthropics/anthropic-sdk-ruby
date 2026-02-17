# typed: strong

module Anthropic
  module Models
    class TextEditorCodeExecutionViewResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::TextEditorCodeExecutionViewResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :content

      sig do
        returns(
          Anthropic::TextEditorCodeExecutionViewResultBlockParam::FileType::OrSymbol
        )
      end
      attr_accessor :file_type

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Integer)) }
      attr_accessor :num_lines

      sig { returns(T.nilable(Integer)) }
      attr_accessor :start_line

      sig { returns(T.nilable(Integer)) }
      attr_accessor :total_lines

      sig do
        params(
          content: String,
          file_type:
            Anthropic::TextEditorCodeExecutionViewResultBlockParam::FileType::OrSymbol,
          num_lines: T.nilable(Integer),
          start_line: T.nilable(Integer),
          total_lines: T.nilable(Integer),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        file_type:,
        num_lines: nil,
        start_line: nil,
        total_lines: nil,
        type: :text_editor_code_execution_view_result
      )
      end

      sig do
        override.returns(
          {
            content: String,
            file_type:
              Anthropic::TextEditorCodeExecutionViewResultBlockParam::FileType::OrSymbol,
            type: Symbol,
            num_lines: T.nilable(Integer),
            start_line: T.nilable(Integer),
            total_lines: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end

      module FileType
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Anthropic::TextEditorCodeExecutionViewResultBlockParam::FileType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(
            :text,
            Anthropic::TextEditorCodeExecutionViewResultBlockParam::FileType::TaggedSymbol
          )
        IMAGE =
          T.let(
            :image,
            Anthropic::TextEditorCodeExecutionViewResultBlockParam::FileType::TaggedSymbol
          )
        PDF =
          T.let(
            :pdf,
            Anthropic::TextEditorCodeExecutionViewResultBlockParam::FileType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::TextEditorCodeExecutionViewResultBlockParam::FileType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end

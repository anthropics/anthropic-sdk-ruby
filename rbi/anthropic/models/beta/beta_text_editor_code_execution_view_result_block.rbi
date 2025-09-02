# typed: strong

module Anthropic
  module Models
    BetaTextEditorCodeExecutionViewResultBlock =
      Beta::BetaTextEditorCodeExecutionViewResultBlock

    module Beta
      class BetaTextEditorCodeExecutionViewResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :content

        sig do
          returns(
            Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType::TaggedSymbol
          )
        end
        attr_accessor :file_type

        sig { returns(T.nilable(Integer)) }
        attr_accessor :num_lines

        sig { returns(T.nilable(Integer)) }
        attr_accessor :start_line

        sig { returns(T.nilable(Integer)) }
        attr_accessor :total_lines

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content: String,
            file_type:
              Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType::OrSymbol,
            num_lines: T.nilable(Integer),
            start_line: T.nilable(Integer),
            total_lines: T.nilable(Integer),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          content:,
          file_type:,
          num_lines:,
          start_line:,
          total_lines:,
          type: :text_editor_code_execution_view_result
        )
        end

        sig do
          override.returns(
            {
              content: String,
              file_type:
                Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType::TaggedSymbol,
              num_lines: T.nilable(Integer),
              start_line: T.nilable(Integer),
              total_lines: T.nilable(Integer),
              type: Symbol
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
                Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :text,
              Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType::TaggedSymbol
            )
          IMAGE =
            T.let(
              :image,
              Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType::TaggedSymbol
            )
          PDF =
            T.let(
              :pdf,
              Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

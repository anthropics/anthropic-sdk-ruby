# typed: strong

module Anthropic
  module Models
    BetaMemoryTool20250818InsertCommand =
      Beta::BetaMemoryTool20250818InsertCommand

    module Beta
      class BetaMemoryTool20250818InsertCommand < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMemoryTool20250818InsertCommand,
              Anthropic::Internal::AnyHash
            )
          end

        # Command type identifier
        sig { returns(Symbol) }
        attr_accessor :command

        # Line number where text should be inserted
        sig { returns(Integer) }
        attr_accessor :insert_line

        # Text to insert at the specified line
        sig { returns(String) }
        attr_accessor :insert_text

        # Path to the file where text should be inserted
        sig { returns(String) }
        attr_accessor :path

        sig do
          params(
            insert_line: Integer,
            insert_text: String,
            path: String,
            command: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Line number where text should be inserted
          insert_line:,
          # Text to insert at the specified line
          insert_text:,
          # Path to the file where text should be inserted
          path:,
          # Command type identifier
          command: :insert
        )
        end

        sig do
          override.returns(
            {
              command: Symbol,
              insert_line: Integer,
              insert_text: String,
              path: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

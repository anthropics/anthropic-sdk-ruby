# typed: strong

module Anthropic
  module Models
    BetaMemoryTool20250818RenameCommand =
      Beta::BetaMemoryTool20250818RenameCommand

    module Beta
      class BetaMemoryTool20250818RenameCommand < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMemoryTool20250818RenameCommand,
              Anthropic::Internal::AnyHash
            )
          end

        # Command type identifier
        sig { returns(Symbol) }
        attr_accessor :command

        # New path for the file or directory
        sig { returns(String) }
        attr_accessor :new_path

        # Current path of the file or directory
        sig { returns(String) }
        attr_accessor :old_path

        sig do
          params(new_path: String, old_path: String, command: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # New path for the file or directory
          new_path:,
          # Current path of the file or directory
          old_path:,
          # Command type identifier
          command: :rename
        )
        end

        sig do
          override.returns(
            { command: Symbol, new_path: String, old_path: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end

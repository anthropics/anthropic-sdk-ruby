# typed: strong

module Anthropic
  module Models
    BetaMemoryTool20250818StrReplaceCommand =
      Beta::BetaMemoryTool20250818StrReplaceCommand

    module Beta
      class BetaMemoryTool20250818StrReplaceCommand < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMemoryTool20250818StrReplaceCommand,
              Anthropic::Internal::AnyHash
            )
          end

        # Command type identifier
        sig { returns(Symbol) }
        attr_accessor :command

        # Text to replace with
        sig { returns(String) }
        attr_accessor :new_str

        # Text to search for and replace
        sig { returns(String) }
        attr_accessor :old_str

        # Path to the file where text should be replaced
        sig { returns(String) }
        attr_accessor :path

        sig do
          params(
            new_str: String,
            old_str: String,
            path: String,
            command: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Text to replace with
          new_str:,
          # Text to search for and replace
          old_str:,
          # Path to the file where text should be replaced
          path:,
          # Command type identifier
          command: :str_replace
        )
        end

        sig do
          override.returns(
            { command: Symbol, new_str: String, old_str: String, path: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end

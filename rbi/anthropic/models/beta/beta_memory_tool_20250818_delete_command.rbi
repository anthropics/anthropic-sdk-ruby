# typed: strong

module Anthropic
  module Models
    BetaMemoryTool20250818DeleteCommand =
      Beta::BetaMemoryTool20250818DeleteCommand

    module Beta
      class BetaMemoryTool20250818DeleteCommand < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMemoryTool20250818DeleteCommand,
              Anthropic::Internal::AnyHash
            )
          end

        # Command type identifier
        sig { returns(Symbol) }
        attr_accessor :command

        # Path to the file or directory to delete
        sig { returns(String) }
        attr_accessor :path

        sig { params(path: String, command: Symbol).returns(T.attached_class) }
        def self.new(
          # Path to the file or directory to delete
          path:,
          # Command type identifier
          command: :delete
        )
        end

        sig { override.returns({ command: Symbol, path: String }) }
        def to_hash
        end
      end
    end
  end
end

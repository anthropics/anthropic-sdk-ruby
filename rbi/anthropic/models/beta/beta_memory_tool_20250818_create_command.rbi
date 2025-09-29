# typed: strong

module Anthropic
  module Models
    BetaMemoryTool20250818CreateCommand =
      Beta::BetaMemoryTool20250818CreateCommand

    module Beta
      class BetaMemoryTool20250818CreateCommand < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMemoryTool20250818CreateCommand,
              Anthropic::Internal::AnyHash
            )
          end

        # Command type identifier
        sig { returns(Symbol) }
        attr_accessor :command

        # Content to write to the file
        sig { returns(String) }
        attr_accessor :file_text

        # Path where the file should be created
        sig { returns(String) }
        attr_accessor :path

        sig do
          params(file_text: String, path: String, command: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Content to write to the file
          file_text:,
          # Path where the file should be created
          path:,
          # Command type identifier
          command: :create
        )
        end

        sig do
          override.returns({ command: Symbol, file_text: String, path: String })
        end
        def to_hash
        end
      end
    end
  end
end

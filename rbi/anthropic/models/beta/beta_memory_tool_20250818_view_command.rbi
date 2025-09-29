# typed: strong

module Anthropic
  module Models
    BetaMemoryTool20250818ViewCommand = Beta::BetaMemoryTool20250818ViewCommand

    module Beta
      class BetaMemoryTool20250818ViewCommand < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMemoryTool20250818ViewCommand,
              Anthropic::Internal::AnyHash
            )
          end

        # Command type identifier
        sig { returns(Symbol) }
        attr_accessor :command

        # Path to directory or file to view
        sig { returns(String) }
        attr_accessor :path

        # Optional line range for viewing specific lines
        sig { returns(T.nilable(T::Array[Integer])) }
        attr_reader :view_range

        sig { params(view_range: T::Array[Integer]).void }
        attr_writer :view_range

        sig do
          params(
            path: String,
            view_range: T::Array[Integer],
            command: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Path to directory or file to view
          path:,
          # Optional line range for viewing specific lines
          view_range: nil,
          # Command type identifier
          command: :view
        )
        end

        sig do
          override.returns(
            { command: Symbol, path: String, view_range: T::Array[Integer] }
          )
        end
        def to_hash
        end
      end
    end
  end
end

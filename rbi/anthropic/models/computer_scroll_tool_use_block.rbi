# typed: strong

module Anthropic
  module Models
    class ComputerScrollToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ComputerScrollToolUseBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Which party invoked the tool call: the model directly, or a server tool on its
      # behalf.
      sig { returns(Anthropic::ToolUseCaller::Variants) }
      attr_accessor :caller_

      # Scroll the screen at the specified (x, y) pixel coordinate, or the current
      # cursor position if `coordinate` is omitted. Do NOT use PageUp/PageDown to
      # scroll.
      sig { returns(Anthropic::ComputerScrollInput) }
      attr_reader :input

      sig { params(input: Anthropic::ComputerScrollInput::OrHash).void }
      attr_writer :input

      sig { returns(Symbol) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :toolset_name

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            ),
          input: Anthropic::ComputerScrollInput::OrHash,
          name: Symbol,
          toolset_name: Symbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Which party invoked the tool call: the model directly, or a server tool on its
        # behalf.
        caller_:,
        # Scroll the screen at the specified (x, y) pixel coordinate, or the current
        # cursor position if `coordinate` is omitted. Do NOT use PageUp/PageDown to
        # scroll.
        input:,
        name: :scroll,
        toolset_name: :computer,
        type: :tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            caller_: Anthropic::ToolUseCaller::Variants,
            input: Anthropic::ComputerScrollInput,
            name: Symbol,
            toolset_name: Symbol,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end

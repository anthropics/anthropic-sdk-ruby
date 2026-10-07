# typed: strong

module Anthropic
  module Models
    class BrowserKeyToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserKeyToolUseBlock, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Which party invoked the tool call: the model directly, or a server tool on its
      # behalf.
      sig { returns(Anthropic::ToolUseCaller::Variants) }
      attr_accessor :caller_

      # Press a key or key chord. Use "+" to combine modifiers with a key (e.g.
      # "ctrl+a", "cmd+shift+p") and space to sequence presses (e.g. "Backspace
      # Backspace Delete"). Common names like "Return", "Tab", "Escape", "BackSpace" are
      # supported.
      sig { returns(Anthropic::BrowserKeyInput) }
      attr_reader :input

      sig { params(input: Anthropic::BrowserKeyInput::OrHash).void }
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
          input: Anthropic::BrowserKeyInput::OrHash,
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
        # Press a key or key chord. Use "+" to combine modifiers with a key (e.g.
        # "ctrl+a", "cmd+shift+p") and space to sequence presses (e.g. "Backspace
        # Backspace Delete"). Common names like "Return", "Tab", "Escape", "BackSpace" are
        # supported.
        input:,
        name: :key,
        toolset_name: :browser,
        type: :tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            caller_: Anthropic::ToolUseCaller::Variants,
            input: Anthropic::BrowserKeyInput,
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

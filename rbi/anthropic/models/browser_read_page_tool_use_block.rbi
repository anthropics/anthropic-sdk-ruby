# typed: strong

module Anthropic
  module Models
    class BrowserReadPageToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserReadPageToolUseBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Which party invoked the tool call: the model directly, or a server tool on its
      # behalf.
      sig { returns(Anthropic::ToolUseCaller::Variants) }
      attr_accessor :caller_

      # Return a structured accessibility tree of the page (or the subtree rooted at
      # `ref`), with element references like [ref_7] that can be used as targets on
      # later actions. Output is capped at 50,000 characters — narrow with `ref` or a
      # smaller `depth` when exceeded.
      sig { returns(Anthropic::BrowserReadPageInput) }
      attr_reader :input

      sig { params(input: Anthropic::BrowserReadPageInput::OrHash).void }
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
          input: Anthropic::BrowserReadPageInput::OrHash,
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
        # Return a structured accessibility tree of the page (or the subtree rooted at
        # `ref`), with element references like [ref_7] that can be used as targets on
        # later actions. Output is capped at 50,000 characters — narrow with `ref` or a
        # smaller `depth` when exceeded.
        input:,
        name: :read_page,
        toolset_name: :browser,
        type: :tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            caller_: Anthropic::ToolUseCaller::Variants,
            input: Anthropic::BrowserReadPageInput,
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

# typed: strong

module Anthropic
  module Models
    class BrowserFormInputToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserFormInputToolUseBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Which party invoked the tool call: the model directly, or a server tool on its
      # behalf.
      sig { returns(Anthropic::ToolUseCaller::Variants) }
      attr_accessor :caller_

      # Set the value of a form element (input, textarea, select, checkbox). Use a
      # boolean for checkboxes, an option value or text for selects.
      sig { returns(Anthropic::BrowserFormInputInput) }
      attr_reader :input

      sig { params(input: Anthropic::BrowserFormInputInput::OrHash).void }
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
          input: Anthropic::BrowserFormInputInput::OrHash,
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
        # Set the value of a form element (input, textarea, select, checkbox). Use a
        # boolean for checkboxes, an option value or text for selects.
        input:,
        name: :form_input,
        toolset_name: :browser,
        type: :tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            caller_: Anthropic::ToolUseCaller::Variants,
            input: Anthropic::BrowserFormInputInput,
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

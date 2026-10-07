# typed: strong

module Anthropic
  module Models
    class BrowserFileUploadToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserFileUploadToolUseBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Which party invoked the tool call: the model directly, or a server tool on its
      # behalf.
      sig { returns(Anthropic::ToolUseCaller::Variants) }
      attr_accessor :caller_

      # Set the value of a file-input element to one or more files. The target must be
      # an element reference; at least one of paths or document_ids is required.
      sig { returns(Anthropic::BrowserFileUploadInput) }
      attr_reader :input

      sig { params(input: Anthropic::BrowserFileUploadInput::OrHash).void }
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
          input: Anthropic::BrowserFileUploadInput::OrHash,
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
        # Set the value of a file-input element to one or more files. The target must be
        # an element reference; at least one of paths or document_ids is required.
        input:,
        name: :file_upload,
        toolset_name: :browser,
        type: :tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            caller_: Anthropic::ToolUseCaller::Variants,
            input: Anthropic::BrowserFileUploadInput,
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

# typed: strong

module Anthropic
  module Models
    class BrowserZoomToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserZoomToolUseBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Which party invoked the tool call: the model directly, or a server tool on its
      # behalf.
      sig { returns(Anthropic::ToolUseCaller::Variants) }
      attr_accessor :caller_

      # Return a cropped screenshot of the given viewport region, scaled up for closer
      # inspection — useful for small icons, buttons, or text. Coordinates are in the
      # same viewport-pixel space as a full screenshot.
      sig { returns(Anthropic::BrowserZoomInput) }
      attr_reader :input

      sig { params(input: Anthropic::BrowserZoomInput::OrHash).void }
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
          input: Anthropic::BrowserZoomInput::OrHash,
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
        # Return a cropped screenshot of the given viewport region, scaled up for closer
        # inspection — useful for small icons, buttons, or text. Coordinates are in the
        # same viewport-pixel space as a full screenshot.
        input:,
        name: :zoom,
        toolset_name: :browser,
        type: :tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            caller_: Anthropic::ToolUseCaller::Variants,
            input: Anthropic::BrowserZoomInput,
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

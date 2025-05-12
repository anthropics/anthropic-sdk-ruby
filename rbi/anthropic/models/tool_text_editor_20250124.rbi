# typed: strong

module Anthropic
  module Models
    class ToolTextEditor20250124 < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ToolTextEditor20250124, Anthropic::Internal::AnyHash)
        end

      # Name of the tool.
      #
      # This is how the tool will be called by the model and in `tool_use` blocks.
      sig { returns(Symbol) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          name: Symbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        name: :str_replace_editor,
        type: :text_editor_20250124
      )
      end

      sig do
        override.returns(
          {
            name: Symbol,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral)
          }
        )
      end
      def to_hash
      end
    end
  end
end

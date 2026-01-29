# typed: strong

module Anthropic
  module Models
    class ToolTextEditor20250728 < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ToolTextEditor20250728, Anthropic::Internal::AnyHash)
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

      # Maximum number of characters to display when viewing a file. If not specified,
      # defaults to displaying the full file.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_characters

      # When true, guarantees schema validation on tool names and inputs
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :strict

      sig { params(strict: T::Boolean).void }
      attr_writer :strict

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          max_characters: T.nilable(Integer),
          strict: T::Boolean,
          name: Symbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # Maximum number of characters to display when viewing a file. If not specified,
        # defaults to displaying the full file.
        max_characters: nil,
        # When true, guarantees schema validation on tool names and inputs
        strict: nil,
        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        name: :str_replace_based_edit_tool,
        type: :text_editor_20250728
      )
      end

      sig do
        override.returns(
          {
            name: Symbol,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            max_characters: T.nilable(Integer),
            strict: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end

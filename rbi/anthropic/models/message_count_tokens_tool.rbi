# typed: strong

module Anthropic
  module Models
    module MessageCountTokensTool
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::Tool,
            Anthropic::ToolBash20250124,
            Anthropic::ToolTextEditor20250124,
            Anthropic::MessageCountTokensTool::TextEditor20250429,
            Anthropic::ToolTextEditor20250728,
            Anthropic::WebSearchTool20250305
          )
        end

      class TextEditor20250429 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::MessageCountTokensTool::TextEditor20250429,
              Anthropic::Internal::AnyHash
            )
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
          name: :str_replace_based_edit_tool,
          type: :text_editor_20250429
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

      sig do
        override.returns(T::Array[Anthropic::MessageCountTokensTool::Variants])
      end
      def self.variants
      end
    end
  end
end

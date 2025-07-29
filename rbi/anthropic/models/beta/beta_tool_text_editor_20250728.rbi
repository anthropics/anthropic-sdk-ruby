# typed: strong

module Anthropic
  module Models
    BetaToolTextEditor20250728 = Beta::BetaToolTextEditor20250728

    module Beta
      class BetaToolTextEditor20250728 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolTextEditor20250728,
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
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # Maximum number of characters to display when viewing a file. If not specified,
        # defaults to displaying the full file.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_characters

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            max_characters: T.nilable(Integer),
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
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              max_characters: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

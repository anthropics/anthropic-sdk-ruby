# typed: strong

module Anthropic
  module Models
    BetaBrowserListTabsToolUseBlock = Beta::BetaBrowserListTabsToolUseBlock

    module Beta
      class BetaBrowserListTabsToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserListTabsToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # List all open tabs with each tab's tab_id, title, and URL.
        sig { returns(Anthropic::Beta::BetaBrowserListTabsInput) }
        attr_reader :input

        sig do
          params(input: Anthropic::Beta::BetaBrowserListTabsInput::OrHash).void
        end
        attr_writer :input

        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :toolset_name

        sig { returns(Symbol) }
        attr_accessor :type

        # Which party invoked the tool call: the model directly, or a server tool on its
        # behalf.
        sig { returns(T.nilable(Anthropic::Beta::BetaToolUseCaller::Variants)) }
        attr_reader :caller_

        sig do
          params(
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              )
          ).void
        end
        attr_writer :caller_

        sig do
          params(
            id: String,
            input: Anthropic::Beta::BetaBrowserListTabsInput::OrHash,
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              ),
            name: Symbol,
            toolset_name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # List all open tabs with each tab's tab_id, title, and URL.
          input:,
          # Which party invoked the tool call: the model directly, or a server tool on its
          # behalf.
          caller_: nil,
          name: :list_tabs,
          toolset_name: :browser,
          type: :tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: Anthropic::Beta::BetaBrowserListTabsInput,
              name: Symbol,
              toolset_name: Symbol,
              type: Symbol,
              caller_: Anthropic::Beta::BetaToolUseCaller::Variants
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

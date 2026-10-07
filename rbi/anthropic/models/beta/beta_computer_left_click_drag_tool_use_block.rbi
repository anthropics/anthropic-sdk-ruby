# typed: strong

module Anthropic
  module Models
    BetaComputerLeftClickDragToolUseBlock =
      Beta::BetaComputerLeftClickDragToolUseBlock

    module Beta
      class BetaComputerLeftClickDragToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerLeftClickDragToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Click and drag the cursor from `start_coordinate` to `coordinate`.
        sig { returns(Anthropic::Beta::BetaComputerLeftClickDragInput) }
        attr_reader :input

        sig do
          params(
            input: Anthropic::Beta::BetaComputerLeftClickDragInput::OrHash
          ).void
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
            input: Anthropic::Beta::BetaComputerLeftClickDragInput::OrHash,
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
          # Click and drag the cursor from `start_coordinate` to `coordinate`.
          input:,
          # Which party invoked the tool call: the model directly, or a server tool on its
          # behalf.
          caller_: nil,
          name: :left_click_drag,
          toolset_name: :computer,
          type: :tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: Anthropic::Beta::BetaComputerLeftClickDragInput,
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

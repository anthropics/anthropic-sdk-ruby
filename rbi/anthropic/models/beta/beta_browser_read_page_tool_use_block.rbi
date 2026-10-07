# typed: strong

module Anthropic
  module Models
    BetaBrowserReadPageToolUseBlock = Beta::BetaBrowserReadPageToolUseBlock

    module Beta
      class BetaBrowserReadPageToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserReadPageToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Return a structured accessibility tree of the page (or the subtree rooted at
        # `ref`), with element references like [ref_7] that can be used as targets on
        # later actions. Output is capped at 50,000 characters — narrow with `ref` or a
        # smaller `depth` when exceeded.
        sig { returns(Anthropic::Beta::BetaBrowserReadPageInput) }
        attr_reader :input

        sig do
          params(input: Anthropic::Beta::BetaBrowserReadPageInput::OrHash).void
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
            input: Anthropic::Beta::BetaBrowserReadPageInput::OrHash,
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
          # Return a structured accessibility tree of the page (or the subtree rooted at
          # `ref`), with element references like [ref_7] that can be used as targets on
          # later actions. Output is capped at 50,000 characters — narrow with `ref` or a
          # smaller `depth` when exceeded.
          input:,
          # Which party invoked the tool call: the model directly, or a server tool on its
          # behalf.
          caller_: nil,
          name: :read_page,
          toolset_name: :browser,
          type: :tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: Anthropic::Beta::BetaBrowserReadPageInput,
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

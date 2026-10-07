# typed: strong

module Anthropic
  module Models
    BetaBrowserScreenshotToolUseBlock = Beta::BetaBrowserScreenshotToolUseBlock

    module Beta
      class BetaBrowserScreenshotToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserScreenshotToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Capture the current browser viewport.
        sig { returns(Anthropic::Beta::BetaBrowserScreenshotInput) }
        attr_reader :input

        sig do
          params(
            input: Anthropic::Beta::BetaBrowserScreenshotInput::OrHash
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
            input: Anthropic::Beta::BetaBrowserScreenshotInput::OrHash,
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
          # Capture the current browser viewport.
          input:,
          # Which party invoked the tool call: the model directly, or a server tool on its
          # behalf.
          caller_: nil,
          name: :screenshot,
          toolset_name: :browser,
          type: :tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: Anthropic::Beta::BetaBrowserScreenshotInput,
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

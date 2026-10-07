# typed: strong

module Anthropic
  module Models
    BetaBrowserReadNetworkToolUseBlock =
      Beta::BetaBrowserReadNetworkToolUseBlock

    module Beta
      class BetaBrowserReadNetworkToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserReadNetworkToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Return the network requests (method, URL, status, MIME type, timing) recorded
        # since the driver attached to the tab and since the last read, one line per
        # entry. An empty result does not mean no traffic for a tab that predates attach.
        sig { returns(Anthropic::Beta::BetaBrowserReadNetworkInput) }
        attr_reader :input

        sig do
          params(
            input: Anthropic::Beta::BetaBrowserReadNetworkInput::OrHash
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
            input: Anthropic::Beta::BetaBrowserReadNetworkInput::OrHash,
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
          # Return the network requests (method, URL, status, MIME type, timing) recorded
          # since the driver attached to the tab and since the last read, one line per
          # entry. An empty result does not mean no traffic for a tab that predates attach.
          input:,
          # Which party invoked the tool call: the model directly, or a server tool on its
          # behalf.
          caller_: nil,
          name: :read_network,
          toolset_name: :browser,
          type: :tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: Anthropic::Beta::BetaBrowserReadNetworkInput,
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

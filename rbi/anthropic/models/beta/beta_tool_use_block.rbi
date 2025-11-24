# typed: strong

module Anthropic
  module Models
    BetaToolUseBlock = Beta::BetaToolUseBlock

    module Beta
      class BetaToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :input

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        # Tool invocation directly from the model.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaToolUseBlock::Caller::Variants)
          )
        end
        attr_reader :caller_

        sig do
          params(
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash
              )
          ).void
        end
        attr_writer :caller_

        sig do
          params(
            id: String,
            input: T::Hash[Symbol, T.anything],
            name: String,
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          input:,
          name:,
          # Tool invocation directly from the model.
          caller_: nil,
          type: :tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: T::Hash[Symbol, T.anything],
              name: String,
              type: Symbol,
              caller_: Anthropic::Beta::BetaToolUseBlock::Caller::Variants
            }
          )
        end
        def to_hash
        end

        # Tool invocation directly from the model.
        module Caller
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaDirectCaller,
                Anthropic::Beta::BetaServerToolCaller
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaToolUseBlock::Caller::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end

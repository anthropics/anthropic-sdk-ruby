# typed: strong

module Anthropic
  module Models
    BetaToolUseBlockParam = Beta::BetaToolUseBlockParam

    module Beta
      class BetaToolUseBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolUseBlockParam,
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

        # Tool invocation directly from the model.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaDirectCaller,
                Anthropic::Beta::BetaServerToolCaller,
                Anthropic::Beta::BetaServerToolCaller20260120
              )
            )
          )
        end
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
            input: T::Hash[Symbol, T.anything],
            name: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          input:,
          name:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
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
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              caller_:
                T.any(
                  Anthropic::Beta::BetaDirectCaller,
                  Anthropic::Beta::BetaServerToolCaller,
                  Anthropic::Beta::BetaServerToolCaller20260120
                )
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
                Anthropic::Beta::BetaServerToolCaller,
                Anthropic::Beta::BetaServerToolCaller20260120
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaToolUseBlockParam::Caller::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end

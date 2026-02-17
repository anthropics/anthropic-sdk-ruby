# typed: strong

module Anthropic
  module Models
    BetaWebSearchToolResultBlock = Beta::BetaWebSearchToolResultBlock

    module Beta
      class BetaWebSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebSearchToolResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaWebSearchToolResultBlockContent::Variants
          )
        end
        attr_accessor :content

        sig { returns(String) }
        attr_accessor :tool_use_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Tool invocation directly from the model.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaWebSearchToolResultBlock::Caller::Variants
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
            content:
              T.any(
                Anthropic::Beta::BetaWebSearchToolResultError::OrHash,
                T::Array[Anthropic::Beta::BetaWebSearchResultBlock::OrHash]
              ),
            tool_use_id: String,
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
          content:,
          tool_use_id:,
          # Tool invocation directly from the model.
          caller_: nil,
          type: :web_search_tool_result
        )
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaWebSearchToolResultBlockContent::Variants,
              tool_use_id: String,
              type: Symbol,
              caller_:
                Anthropic::Beta::BetaWebSearchToolResultBlock::Caller::Variants
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
              T::Array[
                Anthropic::Beta::BetaWebSearchToolResultBlock::Caller::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end

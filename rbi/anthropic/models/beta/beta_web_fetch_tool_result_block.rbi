# typed: strong

module Anthropic
  module Models
    BetaWebFetchToolResultBlock = Beta::BetaWebFetchToolResultBlock

    module Beta
      class BetaWebFetchToolResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchToolResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaWebFetchToolResultBlock::Content::Variants
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
              Anthropic::Beta::BetaWebFetchToolResultBlock::Caller::Variants
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
                Anthropic::Beta::BetaWebFetchToolResultErrorBlock::OrHash,
                Anthropic::Beta::BetaWebFetchBlock::OrHash
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
          type: :web_fetch_tool_result
        )
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaWebFetchToolResultBlock::Content::Variants,
              tool_use_id: String,
              type: Symbol,
              caller_:
                Anthropic::Beta::BetaWebFetchToolResultBlock::Caller::Variants
            }
          )
        end
        def to_hash
        end

        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaWebFetchToolResultErrorBlock,
                Anthropic::Beta::BetaWebFetchBlock
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebFetchToolResultBlock::Content::Variants
              ]
            )
          end
          def self.variants
          end
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
                Anthropic::Beta::BetaWebFetchToolResultBlock::Caller::Variants
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

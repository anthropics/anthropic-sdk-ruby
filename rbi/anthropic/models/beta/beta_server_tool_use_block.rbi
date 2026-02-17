# typed: strong

module Anthropic
  module Models
    BetaServerToolUseBlock = Beta::BetaServerToolUseBlock

    module Beta
      class BetaServerToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaServerToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :input

        sig do
          returns(Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol)
        end
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        # Tool invocation directly from the model.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaServerToolUseBlock::Caller::Variants)
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
            name: Anthropic::Beta::BetaServerToolUseBlock::Name::OrSymbol,
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
          # Tool invocation directly from the model.
          caller_: nil,
          type: :server_tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: T::Hash[Symbol, T.anything],
              name: Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol,
              type: Symbol,
              caller_: Anthropic::Beta::BetaServerToolUseBlock::Caller::Variants
            }
          )
        end
        def to_hash
        end

        module Name
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaServerToolUseBlock::Name)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB_SEARCH =
            T.let(
              :web_search,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )
          WEB_FETCH =
            T.let(
              :web_fetch,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )
          CODE_EXECUTION =
            T.let(
              :code_execution,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )
          BASH_CODE_EXECUTION =
            T.let(
              :bash_code_execution,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )
          TEXT_EDITOR_CODE_EXECUTION =
            T.let(
              :text_editor_code_execution,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )
          TOOL_SEARCH_TOOL_REGEX =
            T.let(
              :tool_search_tool_regex,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )
          TOOL_SEARCH_TOOL_BM25 =
            T.let(
              :tool_search_tool_bm25,
              Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaServerToolUseBlock::Name::TaggedSymbol
              ]
            )
          end
          def self.values
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
                Anthropic::Beta::BetaServerToolUseBlock::Caller::Variants
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

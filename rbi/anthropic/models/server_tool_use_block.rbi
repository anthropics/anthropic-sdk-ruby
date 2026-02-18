# typed: strong

module Anthropic
  module Models
    class ServerToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ServerToolUseBlock, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Tool invocation directly from the model.
      sig { returns(Anthropic::ServerToolUseBlock::Caller::Variants) }
      attr_accessor :caller_

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :input

      sig { returns(Anthropic::ServerToolUseBlock::Name::TaggedSymbol) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            ),
          input: T::Hash[Symbol, T.anything],
          name: Anthropic::ServerToolUseBlock::Name::OrSymbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Tool invocation directly from the model.
        caller_:,
        input:,
        name:,
        type: :server_tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            caller_: Anthropic::ServerToolUseBlock::Caller::Variants,
            input: T::Hash[Symbol, T.anything],
            name: Anthropic::ServerToolUseBlock::Name::TaggedSymbol,
            type: Symbol
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
              Anthropic::DirectCaller,
              Anthropic::ServerToolCaller,
              Anthropic::ServerToolCaller20260120
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::ServerToolUseBlock::Caller::Variants]
          )
        end
        def self.variants
        end
      end

      module Name
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::ServerToolUseBlock::Name) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WEB_SEARCH =
          T.let(:web_search, Anthropic::ServerToolUseBlock::Name::TaggedSymbol)
        WEB_FETCH =
          T.let(:web_fetch, Anthropic::ServerToolUseBlock::Name::TaggedSymbol)
        CODE_EXECUTION =
          T.let(
            :code_execution,
            Anthropic::ServerToolUseBlock::Name::TaggedSymbol
          )
        BASH_CODE_EXECUTION =
          T.let(
            :bash_code_execution,
            Anthropic::ServerToolUseBlock::Name::TaggedSymbol
          )
        TEXT_EDITOR_CODE_EXECUTION =
          T.let(
            :text_editor_code_execution,
            Anthropic::ServerToolUseBlock::Name::TaggedSymbol
          )
        TOOL_SEARCH_TOOL_REGEX =
          T.let(
            :tool_search_tool_regex,
            Anthropic::ServerToolUseBlock::Name::TaggedSymbol
          )
        TOOL_SEARCH_TOOL_BM25 =
          T.let(
            :tool_search_tool_bm25,
            Anthropic::ServerToolUseBlock::Name::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::ServerToolUseBlock::Name::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

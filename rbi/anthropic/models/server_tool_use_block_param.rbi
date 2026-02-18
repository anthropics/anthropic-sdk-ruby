# typed: strong

module Anthropic
  module Models
    class ServerToolUseBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ServerToolUseBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :input

      sig { returns(Anthropic::ServerToolUseBlockParam::Name::OrSymbol) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # Tool invocation directly from the model.
      sig do
        returns(
          T.nilable(
            T.any(
              Anthropic::DirectCaller,
              Anthropic::ServerToolCaller,
              Anthropic::ServerToolCaller20260120
            )
          )
        )
      end
      attr_reader :caller_

      sig do
        params(
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            )
        ).void
      end
      attr_writer :caller_

      sig do
        params(
          id: String,
          input: T::Hash[Symbol, T.anything],
          name: Anthropic::ServerToolUseBlockParam::Name::OrSymbol,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
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
        type: :server_tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            input: T::Hash[Symbol, T.anything],
            name: Anthropic::ServerToolUseBlockParam::Name::OrSymbol,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            caller_:
              T.any(
                Anthropic::DirectCaller,
                Anthropic::ServerToolCaller,
                Anthropic::ServerToolCaller20260120
              )
          }
        )
      end
      def to_hash
      end

      module Name
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::ServerToolUseBlockParam::Name)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WEB_SEARCH =
          T.let(
            :web_search,
            Anthropic::ServerToolUseBlockParam::Name::TaggedSymbol
          )
        WEB_FETCH =
          T.let(
            :web_fetch,
            Anthropic::ServerToolUseBlockParam::Name::TaggedSymbol
          )
        CODE_EXECUTION =
          T.let(
            :code_execution,
            Anthropic::ServerToolUseBlockParam::Name::TaggedSymbol
          )
        BASH_CODE_EXECUTION =
          T.let(
            :bash_code_execution,
            Anthropic::ServerToolUseBlockParam::Name::TaggedSymbol
          )
        TEXT_EDITOR_CODE_EXECUTION =
          T.let(
            :text_editor_code_execution,
            Anthropic::ServerToolUseBlockParam::Name::TaggedSymbol
          )
        TOOL_SEARCH_TOOL_REGEX =
          T.let(
            :tool_search_tool_regex,
            Anthropic::ServerToolUseBlockParam::Name::TaggedSymbol
          )
        TOOL_SEARCH_TOOL_BM25 =
          T.let(
            :tool_search_tool_bm25,
            Anthropic::ServerToolUseBlockParam::Name::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::ServerToolUseBlockParam::Name::TaggedSymbol]
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
              Anthropic::DirectCaller,
              Anthropic::ServerToolCaller,
              Anthropic::ServerToolCaller20260120
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::ServerToolUseBlockParam::Caller::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

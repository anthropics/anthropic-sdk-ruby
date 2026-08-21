# typed: strong

module Anthropic
  module Models
    class WebSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WebSearchToolResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      # Tool invocation directly from the model.
      sig { returns(Anthropic::WebSearchToolResultBlock::Caller::Variants) }
      attr_accessor :caller_

      sig { returns(Anthropic::WebSearchToolResultBlockContent::Variants) }
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            ),
          content:
            T.any(
              Anthropic::WebSearchToolResultError::OrHash,
              T::Array[Anthropic::WebSearchResultBlock::OrHash]
            ),
          tool_use_id: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Tool invocation directly from the model.
        caller_:,
        content:,
        tool_use_id:,
        type: :web_search_tool_result
      )
      end

      sig do
        override.returns(
          {
            caller_: Anthropic::WebSearchToolResultBlock::Caller::Variants,
            content: Anthropic::WebSearchToolResultBlockContent::Variants,
            tool_use_id: String,
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

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::WebSearchToolResultBlock::Caller::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::WebSearchToolResultBlock::Caller::Type::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::WebSearchToolResultBlock::Caller::Type::TaggedSymbol
            )
          CODE_EXECUTION_20260120 =
            T.let(
              :code_execution_20260120,
              Anthropic::WebSearchToolResultBlock::Caller::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::WebSearchToolResultBlock::Caller::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::WebSearchToolResultBlock::Caller::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(type: T.any(Symbol, String), tool_id: String).returns(
            Anthropic::WebSearchToolResultBlock::Caller::Variants
          )
        end
        def self.new(type:, tool_id: nil)
        end
      end
    end
  end
end

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
              Anthropic::WebSearchToolResultBlock::Caller::CodeExecution20260120::OrHash
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
              Anthropic::WebSearchToolResultBlock::Caller::CodeExecution20260120
            )
          end

        class CodeExecution20260120 < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::WebSearchToolResultBlock::Caller::CodeExecution20260120,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :tool_id

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(tool_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(tool_id:, type: :code_execution_20260120)
          end

          sig { override.returns({ tool_id: String, type: Symbol }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::WebSearchToolResultBlock::Caller::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

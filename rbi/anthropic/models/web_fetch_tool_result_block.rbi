# typed: strong

module Anthropic
  module Models
    class WebFetchToolResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WebFetchToolResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      # Tool invocation directly from the model.
      sig { returns(Anthropic::WebFetchToolResultBlock::Caller::Variants) }
      attr_accessor :caller_

      sig { returns(Anthropic::WebFetchToolResultBlock::Content::Variants) }
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
              Anthropic::WebFetchToolResultBlock::Caller::CodeExecution20260120::OrHash
            ),
          content:
            T.any(
              Anthropic::WebFetchToolResultErrorBlock::OrHash,
              Anthropic::WebFetchBlock::OrHash
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
        type: :web_fetch_tool_result
      )
      end

      sig do
        override.returns(
          {
            caller_: Anthropic::WebFetchToolResultBlock::Caller::Variants,
            content: Anthropic::WebFetchToolResultBlock::Content::Variants,
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
              Anthropic::WebFetchToolResultBlock::Caller::CodeExecution20260120
            )
          end

        class CodeExecution20260120 < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::WebFetchToolResultBlock::Caller::CodeExecution20260120,
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
            T::Array[Anthropic::WebFetchToolResultBlock::Caller::Variants]
          )
        end
        def self.variants
        end
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::WebFetchToolResultErrorBlock,
              Anthropic::WebFetchBlock
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::WebFetchToolResultBlock::Content::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

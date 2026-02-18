# typed: strong

module Anthropic
  module Models
    class ToolUseBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ToolUseBlock, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Tool invocation directly from the model.
      sig { returns(Anthropic::ToolUseBlock::Caller::Variants) }
      attr_accessor :caller_

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :input

      sig { returns(T.nilable(T.anything)) }
      attr_accessor :parsed

      sig { returns(String) }
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
          name: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Tool invocation directly from the model.
        caller_:,
        input:,
        name:,
        type: :tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            caller_: Anthropic::ToolUseBlock::Caller::Variants,
            input: T::Hash[Symbol, T.anything],
            name: String,
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
          override.returns(T::Array[Anthropic::ToolUseBlock::Caller::Variants])
        end
        def self.variants
        end
      end
    end
  end
end

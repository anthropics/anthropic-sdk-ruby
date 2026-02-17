# typed: strong

module Anthropic
  module Models
    class CodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CodeExecutionToolResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      # Code execution result with encrypted stdout for PFC + web_search results.
      sig do
        returns(
          T.any(
            Anthropic::CodeExecutionToolResultErrorParam,
            Anthropic::CodeExecutionResultBlockParam,
            Anthropic::EncryptedCodeExecutionResultBlockParam
          )
        )
      end
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :tool_use_id

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

      sig do
        params(
          content:
            T.any(
              Anthropic::CodeExecutionToolResultErrorParam::OrHash,
              Anthropic::CodeExecutionResultBlockParam::OrHash,
              Anthropic::EncryptedCodeExecutionResultBlockParam::OrHash
            ),
          tool_use_id: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Code execution result with encrypted stdout for PFC + web_search results.
        content:,
        tool_use_id:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        type: :code_execution_tool_result
      )
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                Anthropic::CodeExecutionToolResultErrorParam,
                Anthropic::CodeExecutionResultBlockParam,
                Anthropic::EncryptedCodeExecutionResultBlockParam
              ),
            tool_use_id: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral)
          }
        )
      end
      def to_hash
      end
    end
  end
end

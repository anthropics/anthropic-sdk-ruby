# typed: strong

module Anthropic
  module Models
    class EncryptedCodeExecutionResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::EncryptedCodeExecutionResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Anthropic::CodeExecutionOutputBlockParam]) }
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :encrypted_stdout

      sig { returns(Integer) }
      attr_accessor :return_code

      sig { returns(String) }
      attr_accessor :stderr

      sig { returns(Symbol) }
      attr_accessor :type

      # Code execution result with encrypted stdout for PFC + web_search results.
      sig do
        params(
          content: T::Array[Anthropic::CodeExecutionOutputBlockParam::OrHash],
          encrypted_stdout: String,
          return_code: Integer,
          stderr: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        encrypted_stdout:,
        return_code:,
        stderr:,
        type: :encrypted_code_execution_result
      )
      end

      sig do
        override.returns(
          {
            content: T::Array[Anthropic::CodeExecutionOutputBlockParam],
            encrypted_stdout: String,
            return_code: Integer,
            stderr: String,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end

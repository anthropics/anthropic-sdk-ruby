# typed: strong

module Anthropic
  module Models
    class BashCodeExecutionResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BashCodeExecutionResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Anthropic::BashCodeExecutionOutputBlockParam]) }
      attr_accessor :content

      sig { returns(Integer) }
      attr_accessor :return_code

      sig { returns(String) }
      attr_accessor :stderr

      sig { returns(String) }
      attr_accessor :stdout

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content:
            T::Array[Anthropic::BashCodeExecutionOutputBlockParam::OrHash],
          return_code: Integer,
          stderr: String,
          stdout: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        return_code:,
        stderr:,
        stdout:,
        type: :bash_code_execution_result
      )
      end

      sig do
        override.returns(
          {
            content: T::Array[Anthropic::BashCodeExecutionOutputBlockParam],
            return_code: Integer,
            stderr: String,
            stdout: String,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end

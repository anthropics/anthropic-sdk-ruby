# typed: strong

module Anthropic
  module Models
    BetaEncryptedCodeExecutionResultBlockParam =
      Beta::BetaEncryptedCodeExecutionResultBlockParam

    module Beta
      class BetaEncryptedCodeExecutionResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEncryptedCodeExecutionResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(T::Array[Anthropic::Beta::BetaCodeExecutionOutputBlockParam])
        end
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
            content:
              T::Array[
                Anthropic::Beta::BetaCodeExecutionOutputBlockParam::OrHash
              ],
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
              content:
                T::Array[Anthropic::Beta::BetaCodeExecutionOutputBlockParam],
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
end

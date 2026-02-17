# typed: strong

module Anthropic
  module Models
    class BashCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BashCodeExecutionToolResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            Anthropic::BashCodeExecutionToolResultErrorParam,
            Anthropic::BashCodeExecutionResultBlockParam
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
              Anthropic::BashCodeExecutionToolResultErrorParam::OrHash,
              Anthropic::BashCodeExecutionResultBlockParam::OrHash
            ),
          tool_use_id: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        tool_use_id:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        type: :bash_code_execution_tool_result
      )
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                Anthropic::BashCodeExecutionToolResultErrorParam,
                Anthropic::BashCodeExecutionResultBlockParam
              ),
            tool_use_id: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral)
          }
        )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::BashCodeExecutionToolResultErrorParam,
              Anthropic::BashCodeExecutionResultBlockParam
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::BashCodeExecutionToolResultBlockParam::Content::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end

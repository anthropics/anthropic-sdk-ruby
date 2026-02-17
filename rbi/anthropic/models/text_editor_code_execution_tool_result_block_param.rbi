# typed: strong

module Anthropic
  module Models
    class TextEditorCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::TextEditorCodeExecutionToolResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            Anthropic::TextEditorCodeExecutionToolResultErrorParam,
            Anthropic::TextEditorCodeExecutionViewResultBlockParam,
            Anthropic::TextEditorCodeExecutionCreateResultBlockParam,
            Anthropic::TextEditorCodeExecutionStrReplaceResultBlockParam
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
              Anthropic::TextEditorCodeExecutionToolResultErrorParam::OrHash,
              Anthropic::TextEditorCodeExecutionViewResultBlockParam::OrHash,
              Anthropic::TextEditorCodeExecutionCreateResultBlockParam::OrHash,
              Anthropic::TextEditorCodeExecutionStrReplaceResultBlockParam::OrHash
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
        type: :text_editor_code_execution_tool_result
      )
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                Anthropic::TextEditorCodeExecutionToolResultErrorParam,
                Anthropic::TextEditorCodeExecutionViewResultBlockParam,
                Anthropic::TextEditorCodeExecutionCreateResultBlockParam,
                Anthropic::TextEditorCodeExecutionStrReplaceResultBlockParam
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
              Anthropic::TextEditorCodeExecutionToolResultErrorParam,
              Anthropic::TextEditorCodeExecutionViewResultBlockParam,
              Anthropic::TextEditorCodeExecutionCreateResultBlockParam,
              Anthropic::TextEditorCodeExecutionStrReplaceResultBlockParam
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::TextEditorCodeExecutionToolResultBlockParam::Content::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end

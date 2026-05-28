# typed: strong

module Anthropic
  module Models
    class MidConversationSystemBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::MidConversationSystemBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      # System instruction text blocks.
      sig { returns(T::Array[Anthropic::TextBlockParam]) }
      attr_accessor :content

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

      # System instructions that appear mid-conversation.
      #
      # Use this block to provide or update system-level instructions at a specific
      # point in the conversation, rather than only via the top-level `system`
      # parameter.
      sig do
        params(
          content: T::Array[Anthropic::TextBlockParam::OrHash],
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # System instruction text blocks.
        content:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        type: :mid_conv_system
      )
      end

      sig do
        override.returns(
          {
            content: T::Array[Anthropic::TextBlockParam],
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

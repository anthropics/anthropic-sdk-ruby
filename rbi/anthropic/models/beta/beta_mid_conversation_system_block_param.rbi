# typed: strong

module Anthropic
  module Models
    BetaMidConversationSystemBlockParam =
      Beta::BetaMidConversationSystemBlockParam

    module Beta
      class BetaMidConversationSystemBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMidConversationSystemBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        # System instruction text blocks.
        sig { returns(T::Array[Anthropic::Beta::BetaTextBlockParam]) }
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
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
            content: T::Array[Anthropic::Beta::BetaTextBlockParam::OrHash],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
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
              content: T::Array[Anthropic::Beta::BetaTextBlockParam],
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

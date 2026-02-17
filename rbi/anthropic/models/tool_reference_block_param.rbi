# typed: strong

module Anthropic
  module Models
    class ToolReferenceBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ToolReferenceBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :tool_name

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

      # Tool reference block that can be included in tool_result content.
      sig do
        params(
          tool_name: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        tool_name:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        type: :tool_reference
      )
      end

      sig do
        override.returns(
          {
            tool_name: String,
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

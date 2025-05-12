# typed: strong

module Anthropic
  module Models
    class WebSearchToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WebSearchToolResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            T::Array[Anthropic::WebSearchResultBlockParam],
            Anthropic::WebSearchToolRequestError
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
              T::Array[Anthropic::WebSearchResultBlockParam::OrHash],
              Anthropic::WebSearchToolRequestError::OrHash
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
        type: :web_search_tool_result
      )
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                T::Array[Anthropic::WebSearchResultBlockParam],
                Anthropic::WebSearchToolRequestError
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

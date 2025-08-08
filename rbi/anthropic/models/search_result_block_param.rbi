# typed: strong

module Anthropic
  module Models
    class SearchResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::SearchResultBlockParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(T::Array[Anthropic::TextBlockParam]) }
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :source

      sig { returns(String) }
      attr_accessor :title

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

      sig { returns(T.nilable(Anthropic::CitationsConfigParam)) }
      attr_reader :citations

      sig { params(citations: Anthropic::CitationsConfigParam::OrHash).void }
      attr_writer :citations

      sig do
        params(
          content: T::Array[Anthropic::TextBlockParam::OrHash],
          source: String,
          title: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          citations: Anthropic::CitationsConfigParam::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        source:,
        title:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        citations: nil,
        type: :search_result
      )
      end

      sig do
        override.returns(
          {
            content: T::Array[Anthropic::TextBlockParam],
            source: String,
            title: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            citations: Anthropic::CitationsConfigParam
          }
        )
      end
      def to_hash
      end
    end
  end
end

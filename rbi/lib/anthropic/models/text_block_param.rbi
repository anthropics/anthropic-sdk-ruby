# typed: strong

module Anthropic
  module Models
    class TextBlockParam < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          text: String,
          type: Symbol,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          citations: T.nilable(T::Array[Anthropic::Models::TextCitationParam::Variants])
        }
      end

      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_accessor :cache_control

      sig { returns(T.nilable(T::Array[Anthropic::Models::TextCitationParam::Variants])) }
      attr_accessor :citations

      sig do
        params(
          text: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          citations: T.nilable(T::Array[Anthropic::Models::TextCitationParam::Variants]),
          type: Symbol
        ).void
      end
      def initialize(text:, cache_control: nil, citations: nil, type: :text); end

      sig { returns(Anthropic::Models::TextBlockParam::Shape) }
      def to_h; end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    BetaTextBlockParam = T.type_alias { Beta::BetaTextBlockParam }

    module Beta
      class BetaTextBlockParam < Anthropic::BaseModel
        Shape = T.type_alias do
          {
            text: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            citations: T::Array[Anthropic::Models::Beta::BetaTextCitationParam::Variants]
          }
        end

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig { returns(T::Array[Anthropic::Models::Beta::BetaTextCitationParam::Variants]) }
        attr_accessor :citations

        sig do
          params(
            text: String,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            citations: T::Array[Anthropic::Models::Beta::BetaTextCitationParam::Variants],
            type: Symbol
          ).void
        end
        def initialize(text:, cache_control: nil, citations: nil, type: :text); end

        sig { returns(Anthropic::Models::Beta::BetaTextBlockParam::Shape) }
        def to_h; end
      end
    end
  end
end

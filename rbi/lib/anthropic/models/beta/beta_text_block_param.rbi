# typed: strong

module Anthropic
  module Models
    BetaTextBlockParam = T.type_alias { Beta::BetaTextBlockParam }

    module Beta
      class BetaTextBlockParam < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig do
          returns(
            T.nilable(
              T::Array[T.any(
                Anthropic::Models::Beta::BetaCitationCharLocationParam,
                Anthropic::Models::Beta::BetaCitationPageLocationParam,
                Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
              )]
            )
          )
        end
        attr_accessor :citations

        sig do
          params(
            text: String,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            citations: T.nilable(
              T::Array[T.any(
                Anthropic::Models::Beta::BetaCitationCharLocationParam,
                Anthropic::Models::Beta::BetaCitationPageLocationParam,
                Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
              )]
            ),
            type: Symbol
          ).void
        end
        def initialize(text:, cache_control: nil, citations: nil, type: :text); end

        sig do
          override.returns(
            {
              text: String,
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
              citations: T.nilable(
                T::Array[T.any(
                  Anthropic::Models::Beta::BetaCitationCharLocationParam,
                  Anthropic::Models::Beta::BetaCitationPageLocationParam,
                  Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
                )]
              )
            }
          )
        end
        def to_hash; end
      end
    end
  end
end

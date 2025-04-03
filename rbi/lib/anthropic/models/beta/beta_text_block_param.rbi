# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaTextBlockParam < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Internal::Util::AnyHash))
          )
            .void
        end
        attr_writer :cache_control

        sig do
          returns(
            T.nilable(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaCitationCharLocationParam,
                Anthropic::Models::Beta::BetaCitationPageLocationParam,
                Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
              )
              ]
            )
          )
        end
        attr_accessor :citations

        sig do
          params(
            text: String,
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Internal::Util::AnyHash)),
            citations: T.nilable(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaCitationCharLocationParam,
                Anthropic::Internal::Util::AnyHash,
                Anthropic::Models::Beta::BetaCitationPageLocationParam,
                Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
              )
              ]
            ),
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(text:, cache_control: nil, citations: nil, type: :text)
        end

        sig do
          override
            .returns(
              {
                text: String,
                type: Symbol,
                cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
                citations: T.nilable(
                  T::Array[
                  T.any(
                    Anthropic::Models::Beta::BetaCitationCharLocationParam,
                    Anthropic::Models::Beta::BetaCitationPageLocationParam,
                    Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
                  )
                  ]
                )
              }
            )
        end
        def to_hash
        end
      end
    end

    BetaTextBlockParam = Beta::BetaTextBlockParam
  end
end

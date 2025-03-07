# typed: strong

module Anthropic
  module Models
    BetaTextBlockParam = T.type_alias { Beta::BetaTextBlockParam }

    module Beta
      class BetaTextBlockParam < Anthropic::BaseModel
        sig { returns(String) }
        def text
        end

        sig { params(_: String).returns(String) }
        def text=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        def cache_control
        end

        sig do
          params(_: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
            .returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
        end
        def cache_control=(_)
        end

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
        def citations
        end

        sig do
          params(
            _: T.nilable(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaCitationCharLocationParam,
                Anthropic::Models::Beta::BetaCitationPageLocationParam,
                Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
              )
              ]
            )
          )
            .returns(
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
        def citations=(_)
        end

        sig do
          params(
            text: String,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            citations: T.nilable(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaCitationCharLocationParam,
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
  end
end

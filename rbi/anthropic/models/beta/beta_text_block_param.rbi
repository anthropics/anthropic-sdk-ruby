# typed: strong

module Anthropic
  module Models
    BetaTextBlockParam = Beta::BetaTextBlockParam

    module Beta
      class BetaTextBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :text

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

        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaCitationCharLocationParam,
                  Anthropic::Beta::BetaCitationPageLocationParam,
                  Anthropic::Beta::BetaCitationContentBlockLocationParam,
                  Anthropic::Beta::BetaCitationWebSearchResultLocationParam
                )
              ]
            )
          )
        end
        attr_accessor :citations

        sig do
          params(
            text: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            citations:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaCitationCharLocationParam::OrHash,
                    Anthropic::Beta::BetaCitationPageLocationParam::OrHash,
                    Anthropic::Beta::BetaCitationContentBlockLocationParam::OrHash,
                    Anthropic::Beta::BetaCitationWebSearchResultLocationParam::OrHash
                  )
                ]
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          text:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          citations: nil,
          type: :text
        )
        end

        sig do
          override.returns(
            {
              text: String,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              citations:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaCitationCharLocationParam,
                      Anthropic::Beta::BetaCitationPageLocationParam,
                      Anthropic::Beta::BetaCitationContentBlockLocationParam,
                      Anthropic::Beta::BetaCitationWebSearchResultLocationParam
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

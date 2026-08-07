# typed: strong

module Anthropic
  module Models
    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent

    module Beta
      module BetaContentBlockSourceContent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextBlockParam,
              Anthropic::Beta::BetaImageBlockParam
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaContentBlockSourceContent::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
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
                    Anthropic::Beta::BetaCitationWebSearchResultLocationParam::OrHash,
                    Anthropic::Beta::BetaCitationSearchResultLocationParam::OrHash
                  )
                ]
              ),
            source:
              T.any(
                Anthropic::Beta::BetaBase64ImageSource::OrHash,
                Anthropic::Beta::BetaURLImageSource::OrHash,
                Anthropic::Beta::BetaFileImageSource::OrHash
              )
          ).returns(Anthropic::Beta::BetaContentBlockSourceContent::Variants)
        end
        def self.new(
          type:,
          text: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          citations: nil,
          source: nil
        )
        end
      end
    end
  end
end

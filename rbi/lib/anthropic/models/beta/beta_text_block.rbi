# typed: strong

module Anthropic
  module Models
    BetaTextBlock = T.type_alias { Beta::BetaTextBlock }

    module Beta
      class BetaTextBlock < Anthropic::BaseModel
        # Citations supporting the text block.
        #
        #   The type of citation returned will depend on the type of document being cited.
        #   Citing a PDF results in `page_location`, plain text results in `char_location`,
        #   and content document results in `content_block_location`.
        sig do
          returns(
            T.nilable(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaCitationCharLocation,
                Anthropic::Models::Beta::BetaCitationPageLocation,
                Anthropic::Models::Beta::BetaCitationContentBlockLocation
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
                Anthropic::Models::Beta::BetaCitationCharLocation,
                Anthropic::Models::Beta::BetaCitationPageLocation,
                Anthropic::Models::Beta::BetaCitationContentBlockLocation
              )
              ]
            )
          )
            .returns(
              T.nilable(
                T::Array[
                T.any(
                  Anthropic::Models::Beta::BetaCitationCharLocation,
                  Anthropic::Models::Beta::BetaCitationPageLocation,
                  Anthropic::Models::Beta::BetaCitationContentBlockLocation
                )
                ]
              )
            )
        end
        def citations=(_)
        end

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

        sig do
          params(
            citations: T.nilable(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaCitationCharLocation,
                Anthropic::Models::Beta::BetaCitationPageLocation,
                Anthropic::Models::Beta::BetaCitationContentBlockLocation
              )
              ]
            ),
            text: String,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(citations:, text:, type: :text)
        end

        sig do
          override
            .returns(
              {
                citations: T.nilable(
                  T::Array[
                  T.any(
                    Anthropic::Models::Beta::BetaCitationCharLocation,
                    Anthropic::Models::Beta::BetaCitationPageLocation,
                    Anthropic::Models::Beta::BetaCitationContentBlockLocation
                  )
                  ]
                ),
                text: String,
                type: Symbol
              }
            )
        end
        def to_hash
        end
      end
    end
  end
end

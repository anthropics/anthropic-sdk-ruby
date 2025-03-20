# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaCitationsDelta < Anthropic::BaseModel
        sig do
          returns(
            T.any(
              Anthropic::Models::Beta::BetaCitationCharLocation,
              Anthropic::Models::Beta::BetaCitationPageLocation,
              Anthropic::Models::Beta::BetaCitationContentBlockLocation
            )
          )
        end
        def citation
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaCitationCharLocation,
              Anthropic::Models::Beta::BetaCitationPageLocation,
              Anthropic::Models::Beta::BetaCitationContentBlockLocation
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaCitationCharLocation,
                Anthropic::Models::Beta::BetaCitationPageLocation,
                Anthropic::Models::Beta::BetaCitationContentBlockLocation
              )
            )
        end
        def citation=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig do
          params(
            citation: T.any(
              Anthropic::Models::Beta::BetaCitationCharLocation,
              Anthropic::Models::Beta::BetaCitationPageLocation,
              Anthropic::Models::Beta::BetaCitationContentBlockLocation
            ),
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(citation:, type: :citations_delta)
        end

        sig do
          override
            .returns(
              {
                citation: T.any(
                  Anthropic::Models::Beta::BetaCitationCharLocation,
                  Anthropic::Models::Beta::BetaCitationPageLocation,
                  Anthropic::Models::Beta::BetaCitationContentBlockLocation
                ),
                type: Symbol
              }
            )
        end
        def to_hash
        end

        module Citation
          extend Anthropic::Union

          Variants =
            type_template(:out) do
              {
                fixed: T.any(
                  Anthropic::Models::Beta::BetaCitationCharLocation,
                  Anthropic::Models::Beta::BetaCitationPageLocation,
                  Anthropic::Models::Beta::BetaCitationContentBlockLocation
                )
              }
            end

          class << self
            sig do
              override
                .returns(
                  [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
                )
            end
            def variants
            end
          end
        end
      end
    end

    BetaCitationsDelta = Beta::BetaCitationsDelta
  end
end

# typed: strong

module Anthropic
  module Models
    BetaCitationsDelta = T.type_alias { Beta::BetaCitationsDelta }

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
        attr_accessor :citation

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            citation: T.any(
              Anthropic::Models::Beta::BetaCitationCharLocation,
              Anthropic::Models::Beta::BetaCitationPageLocation,
              Anthropic::Models::Beta::BetaCitationContentBlockLocation
            ),
            type: Symbol
          ).void
        end
        def initialize(citation:, type: :citations_delta)
        end

        sig do
          override.returns(
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

        class Citation < Anthropic::Union
          abstract!

          sig do
            override.returns(
              [
                [Symbol, Anthropic::Models::Beta::BetaCitationCharLocation],
                [Symbol, Anthropic::Models::Beta::BetaCitationPageLocation],
                [Symbol, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
              ]
            )
          end
          private_class_method def self.variants
          end
        end
      end
    end
  end
end

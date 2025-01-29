# typed: strong

module Anthropic
  module Models
    BetaCitationsDelta = T.type_alias { Beta::BetaCitationsDelta }

    module Beta
      class BetaCitationsDelta < Anthropic::BaseModel
        Shape = T.type_alias do
          {citation: Anthropic::Models::Beta::BetaCitationsDelta::Citation::Variants, type: Symbol}
        end

        sig { returns(Anthropic::Models::Beta::BetaCitationsDelta::Citation::Variants) }
        attr_accessor :citation

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(citation: Anthropic::Models::Beta::BetaCitationsDelta::Citation::Variants, type: Symbol).void
        end
        def initialize(citation:, type: :citations_delta); end

        sig { returns(Anthropic::Models::Beta::BetaCitationsDelta::Shape) }
        def to_h; end

        class Citation < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(
              Anthropic::Models::Beta::BetaCitationCharLocation,
              Anthropic::Models::Beta::BetaCitationPageLocation,
              Anthropic::Models::Beta::BetaCitationContentBlockLocation
            )
          end

          sig do
            returns(
              [
                [Symbol, Anthropic::Models::Beta::BetaCitationCharLocation],
                [Symbol, Anthropic::Models::Beta::BetaCitationPageLocation],
                [Symbol, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
              ]
            )
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end

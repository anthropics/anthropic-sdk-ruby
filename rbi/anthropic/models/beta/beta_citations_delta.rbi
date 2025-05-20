# typed: strong

module Anthropic
  module Models
    BetaCitationsDelta = Beta::BetaCitationsDelta

    module Beta
      class BetaCitationsDelta < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCitationsDelta,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Beta::BetaCitationsDelta::Citation::Variants) }
        attr_accessor :citation

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            citation:
              T.any(
                Anthropic::Beta::BetaCitationCharLocation::OrHash,
                Anthropic::Beta::BetaCitationPageLocation::OrHash,
                Anthropic::Beta::BetaCitationContentBlockLocation::OrHash,
                Anthropic::Beta::BetaCitationsWebSearchResultLocation::OrHash
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(citation:, type: :citations_delta)
        end

        sig do
          override.returns(
            {
              citation: Anthropic::Beta::BetaCitationsDelta::Citation::Variants,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        module Citation
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaCitationCharLocation,
                Anthropic::Beta::BetaCitationPageLocation,
                Anthropic::Beta::BetaCitationContentBlockLocation,
                Anthropic::Beta::BetaCitationsWebSearchResultLocation
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaCitationsDelta::Citation::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end

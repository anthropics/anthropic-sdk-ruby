# typed: strong

module Anthropic
  module Models
    class CitationsDelta < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::CitationsDelta, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::CitationsDelta::Citation::Variants) }
      attr_accessor :citation

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          citation:
            T.any(
              Anthropic::CitationCharLocation::OrHash,
              Anthropic::CitationPageLocation::OrHash,
              Anthropic::CitationContentBlockLocation::OrHash,
              Anthropic::CitationsWebSearchResultLocation::OrHash
            ),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(citation:, type: :citations_delta)
      end

      sig do
        override.returns(
          {
            citation: Anthropic::CitationsDelta::Citation::Variants,
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
              Anthropic::CitationCharLocation,
              Anthropic::CitationPageLocation,
              Anthropic::CitationContentBlockLocation,
              Anthropic::CitationsWebSearchResultLocation
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::CitationsDelta::Citation::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

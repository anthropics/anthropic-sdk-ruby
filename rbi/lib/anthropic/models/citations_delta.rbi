# typed: strong

module Anthropic
  module Models
    class CitationsDelta < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::CitationCharLocation,
            Anthropic::Models::CitationPageLocation,
            Anthropic::Models::CitationContentBlockLocation
          )
        )
      end
      attr_accessor :citation

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          citation: T.any(
            Anthropic::Models::CitationCharLocation,
            Anthropic::Internal::Util::AnyHash,
            Anthropic::Models::CitationPageLocation,
            Anthropic::Models::CitationContentBlockLocation
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
                Anthropic::Models::CitationCharLocation,
                Anthropic::Models::CitationPageLocation,
                Anthropic::Models::CitationContentBlockLocation
              ),
              type: Symbol
            }
          )
      end
      def to_hash
      end

      module Citation
        extend Anthropic::Union

        sig do
          override
            .returns(
              [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation]
            )
        end
        def self.variants
        end
      end
    end
  end
end

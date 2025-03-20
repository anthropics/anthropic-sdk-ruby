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
      def citation
      end

      sig do
        params(
          _: T.any(
            Anthropic::Models::CitationCharLocation,
            Anthropic::Models::CitationPageLocation,
            Anthropic::Models::CitationContentBlockLocation
          )
        )
          .returns(
            T.any(
              Anthropic::Models::CitationCharLocation,
              Anthropic::Models::CitationPageLocation,
              Anthropic::Models::CitationContentBlockLocation
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
            Anthropic::Models::CitationCharLocation,
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

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::CitationCharLocation,
                Anthropic::Models::CitationPageLocation,
                Anthropic::Models::CitationContentBlockLocation
              )
            }
          end
      end
    end
  end
end

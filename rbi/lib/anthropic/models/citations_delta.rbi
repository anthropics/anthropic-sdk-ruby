# typed: strong

module Anthropic
  module Models
    class CitationsDelta < Anthropic::BaseModel
      Shape = T.type_alias { {citation: Anthropic::Models::CitationsDelta::Citation::Variants, type: Symbol} }

      sig { returns(Anthropic::Models::CitationsDelta::Citation::Variants) }
      attr_accessor :citation

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(citation: Anthropic::Models::CitationsDelta::Citation::Variants, type: Symbol).void }
      def initialize(citation:, type: :citations_delta); end

      sig { returns(Anthropic::Models::CitationsDelta::Shape) }
      def to_h; end

      class Citation < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(
            Anthropic::Models::CitationCharLocation,
            Anthropic::Models::CitationPageLocation,
            Anthropic::Models::CitationContentBlockLocation
          )
        end

        sig do
          override.returns(
            [
              [Symbol, Anthropic::Models::CitationCharLocation],
              [Symbol, Anthropic::Models::CitationPageLocation],
              [Symbol, Anthropic::Models::CitationContentBlockLocation]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end

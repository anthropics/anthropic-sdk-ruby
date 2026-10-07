# typed: strong

module Anthropic
  module Models
    # Where to act: either a viewport coordinate or an element reference.
    module BrowserClickTarget
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Anthropic::BrowserCoordinateTarget, Anthropic::BrowserRefTarget)
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::BrowserClickTarget::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COORDINATE =
          T.let(:coordinate, Anthropic::BrowserClickTarget::Type::TaggedSymbol)
        REF = T.let(:ref, Anthropic::BrowserClickTarget::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::BrowserClickTarget::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig do
        override.returns(T::Array[Anthropic::BrowserClickTarget::Variants])
      end
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: Anthropic::BrowserClickTarget::Type::OrSymbol,
          x: Integer,
          y_: Integer,
          ref: String
        ).returns(Anthropic::BrowserClickTarget::Variants)
      end
      def self.new(
        type:,
        # Pixels from the left edge of the viewport.
        x: nil,
        # Pixels from the top edge of the viewport.
        y_: nil,
        # An element reference (e.g. "ref_7") returned by a prior `read_page` or `find`
        # result.
        ref: nil
      )
      end
    end
  end
end

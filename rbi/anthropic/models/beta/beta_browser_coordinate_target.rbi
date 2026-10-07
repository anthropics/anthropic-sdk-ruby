# typed: strong

module Anthropic
  module Models
    BetaBrowserCoordinateTarget = Beta::BetaBrowserCoordinateTarget

    module Beta
      class BetaBrowserCoordinateTarget < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserCoordinateTarget,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Pixels from the left edge of the viewport.
        sig { returns(Integer) }
        attr_accessor :x

        # Pixels from the top edge of the viewport.
        sig { returns(Integer) }
        attr_accessor :y_

        # A point in the browser viewport, in viewport pixels (the same frame as a
        # full-viewport screenshot).
        sig do
          params(x: Integer, y_: Integer, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Pixels from the left edge of the viewport.
          x:,
          # Pixels from the top edge of the viewport.
          y_:,
          type: :coordinate
        )
        end

        sig { override.returns({ type: Symbol, x: Integer, y_: Integer }) }
        def to_hash
        end
      end
    end
  end
end

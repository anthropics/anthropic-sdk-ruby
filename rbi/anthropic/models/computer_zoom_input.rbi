# typed: strong

module Anthropic
  module Models
    class ComputerZoomInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ComputerZoomInput, Anthropic::Internal::AnyHash)
        end

      # (x0, y0, x1, y1): The region to capture.
      sig { returns(T::Array[Integer]) }
      attr_accessor :region

      # Take a screenshot of a rectangular region. Region coordinates are in the
      # full-screenshot space (not physical display pixels). The crop is scaled up to
      # fill the image budget so fine details become legible.
      sig { params(region: T::Array[Integer]).returns(T.attached_class) }
      def self.new(
        # (x0, y0, x1, y1): The region to capture.
        region:
      )
      end

      sig { override.returns({ region: T::Array[Integer] }) }
      def to_hash
      end
    end
  end
end

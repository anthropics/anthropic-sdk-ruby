# typed: strong

module Anthropic
  module Models
    class BetaRegionNotSupportedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaRegionNotSupportedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request names a region code that the control does not take from this
      # organization. The message names the field.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :region_not_supported)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

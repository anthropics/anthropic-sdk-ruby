# typed: strong

module Anthropic
  module Models
    # The request names a region code that the control does not take from this
    # organization. The message names the field.
    class BetaRegionNotSupportedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaRegionNotSupportedErrorDetails) }
      def details
      end
    end
  end
end

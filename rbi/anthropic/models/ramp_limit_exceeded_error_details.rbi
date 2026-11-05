# typed: strong

module Anthropic
  module Models
    class RampLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RampLimitExceededErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request would exceed a ramp limit, which caps how fast usage can grow. Retry
      # after the time in the `retry-after` header.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :ramp_limit_exceeded)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

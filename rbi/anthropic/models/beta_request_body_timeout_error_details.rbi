# typed: strong

module Anthropic
  module Models
    class BetaRequestBodyTimeoutErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaRequestBodyTimeoutErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request body did not finish arriving in time, so nothing was done. Send a
      # smaller body, or send it over a faster connection.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :request_body_timeout)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

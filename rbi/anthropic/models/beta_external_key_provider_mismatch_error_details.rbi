# typed: strong

module Anthropic
  module Models
    class BetaExternalKeyProviderMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaExternalKeyProviderMismatchErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The External Key is held by a key management service that this endpoint does not
      # take. The message names the field and the service it takes.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :external_key_provider_mismatch)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

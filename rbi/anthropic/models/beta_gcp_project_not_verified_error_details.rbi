# typed: strong

module Anthropic
  module Models
    class BetaGCPProjectNotVerifiedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaGCPProjectNotVerifiedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The organization has not proved that it owns the Google Cloud project that holds
      # the key or bucket. The message names the field.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :gcp_project_not_verified)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

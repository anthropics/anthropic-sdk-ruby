# typed: strong

module Anthropic
  module Models
    class BetaOrganizationNotEnrolledInBetaErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaOrganizationNotEnrolledInBetaErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The beta that the endpoint requires is not enabled for the organization. The
      # message names the beta value.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :organization_not_enrolled_in_beta)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

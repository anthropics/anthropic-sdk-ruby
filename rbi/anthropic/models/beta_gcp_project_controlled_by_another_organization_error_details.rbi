# typed: strong

module Anthropic
  module Models
    class BetaGCPProjectControlledByAnotherOrganizationErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaGCPProjectControlledByAnotherOrganizationErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # Another organization has data controls turned on for this Google Cloud project,
      # or turned them off recently. The message says how long to wait.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :gcp_project_controlled_by_another_organization)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end

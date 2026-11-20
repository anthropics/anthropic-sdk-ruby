# typed: strong

module Anthropic
  module Models
    BetaApprovalRequiredErrorDetails = Beta::BetaApprovalRequiredErrorDetails

    module Beta
      class BetaApprovalRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaApprovalRequiredErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The request field that needs the approval.
        sig { returns(String) }
        attr_accessor :field

        # Turning human review off needs Anthropic's approval for the organization, and
        # the organization doesn't have it. Contact Anthropic support to request approval.
        sig do
          params(field: String, error_code: Symbol).returns(T.attached_class)
        end
        def self.new(
          # The request field that needs the approval.
          field:,
          error_code: :approval_required
        )
        end

        sig { override.returns({ error_code: Symbol, field: String }) }
        def to_hash
        end
      end
    end
  end
end

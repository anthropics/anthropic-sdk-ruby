# typed: strong

module Anthropic
  module Models
    BetaOrganizationNotEligibleErrorDetails =
      Beta::BetaOrganizationNotEligibleErrorDetails

    module Beta
      class BetaOrganizationNotEligibleErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaOrganizationNotEligibleErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The feature isn't offered to this organization. The error's `message` names the
        # kind of organization or, when it names none, says to contact your Anthropic
        # account team.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :organization_not_eligible)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

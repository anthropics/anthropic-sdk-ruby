# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewServiceAccountActor < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor,
                  Anthropic::Internal::AnyHash
                )
              end

            # The ID of the service account (`svac_...`).
            sig { returns(String) }
            attr_accessor :service_account_id

            sig { returns(Symbol) }
            attr_accessor :type

            # A service account.
            sig do
              params(service_account_id: String, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(
              # The ID of the service account (`svac_...`).
              service_account_id:,
              type: :service_account_actor
            )
            end

            sig do
              override.returns({ service_account_id: String, type: Symbol })
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end

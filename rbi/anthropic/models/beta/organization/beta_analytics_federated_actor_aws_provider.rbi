# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActorAWSProvider < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider,
                Anthropic::Internal::AnyHash
              )
            end

          # The AWS account the organization is bound to.
          sig { returns(String) }
          attr_accessor :account_id

          # The AWS-signed ARN of the IAM principal that made the requests.
          sig { returns(String) }
          attr_accessor :signed_principal

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              account_id: String,
              signed_principal: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The AWS account the organization is bound to.
            account_id:,
            # The AWS-signed ARN of the IAM principal that made the requests.
            signed_principal:,
            type: :aws
          )
          end

          sig do
            override.returns(
              { account_id: String, signed_principal: String, type: Symbol }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end

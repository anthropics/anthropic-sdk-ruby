# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActor,
                Anthropic::Internal::AnyHash
              )
            end

          # The trusted provider that asserted the caller's identity.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Variants
            )
          end
          attr_accessor :provider

          # The provider's identifier for the caller: on `aws`, the IAM principal ARN (one
          # role is one actor across its sessions); on `gcp`, the caller's IAM principal
          # identifier as Google Cloud reports it, such as `serviceAccount:<email>`,
          # `user:<email>`, or a `principal://...` URI.
          sig { returns(T.nilable(String)) }
          attr_accessor :subject

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              provider:
                T.any(
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider::OrHash,
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider::OrHash,
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider::OrHash,
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider::OrHash
                ),
              subject: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The trusted provider that asserted the caller's identity.
            provider:,
            # The provider's identifier for the caller: on `aws`, the IAM principal ARN (one
            # role is one actor across its sessions); on `gcp`, the caller's IAM principal
            # identifier as Google Cloud reports it, such as `serviceAccount:<email>`,
            # `user:<email>`, or a `principal://...` URI.
            subject:,
            type: :federated_actor
          )
          end

          sig do
            override.returns(
              {
                provider:
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Variants,
                subject: T.nilable(String),
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsFederatedActorProvider
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider,
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider,
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider,
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AWS =
              T.let(
                :aws,
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Type::TaggedSymbol
              )
            AZURE =
              T.let(
                :azure,
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Type::TaggedSymbol
              )
            GCP =
              T.let(
                :gcp,
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Type::TaggedSymbol
              )
            OIDC =
              T.let(
                :oidc,
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Type::OrSymbol,
              account_id: String,
              signed_principal: String,
              subscription_id: String,
              project_number: String,
              issuer: T.nilable(String)
            ).returns(
              Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider::Variants
            )
          end
          def self.new(
            type:,
            # The AWS account the organization is bound to.
            account_id: nil,
            # The AWS-signed ARN of the IAM principal that made the requests.
            signed_principal: nil,
            # The Azure subscription the organization is bound to.
            subscription_id: nil,
            # The Google Cloud project the organization is bound to.
            project_number: nil,
            # The federation issuer's URL.
            issuer: nil
          )
          end
        end
      end
    end
  end
end

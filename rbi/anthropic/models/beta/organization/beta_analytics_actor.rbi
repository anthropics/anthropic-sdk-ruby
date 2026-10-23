# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsActor
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsReportUserActor,
                Anthropic::Beta::Organization::BetaAnalyticsServiceAccountActor,
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActor,
                Anthropic::Beta::Organization::BetaAnalyticsAPIActor
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaAnalyticsActor::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_ACTOR =
              T.let(
                :user_actor,
                Anthropic::Beta::Organization::BetaAnalyticsActor::Type::TaggedSymbol
              )
            SERVICE_ACCOUNT_ACTOR =
              T.let(
                :service_account_actor,
                Anthropic::Beta::Organization::BetaAnalyticsActor::Type::TaggedSymbol
              )
            FEDERATED_ACTOR =
              T.let(
                :federated_actor,
                Anthropic::Beta::Organization::BetaAnalyticsActor::Type::TaggedSymbol
              )
            API_ACTOR =
              T.let(
                :api_actor,
                Anthropic::Beta::Organization::BetaAnalyticsActor::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAnalyticsActor::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsActor::Variants
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
                Anthropic::Beta::Organization::BetaAnalyticsActor::Type::OrSymbol,
              deleted: T::Boolean,
              email_address: T.nilable(String),
              name: T.nilable(String),
              user_id: String,
              service_account_id: String,
              provider:
                T.any(
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider::OrHash,
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider::OrHash,
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider::OrHash,
                  Anthropic::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider::OrHash
                ),
              subject: T.nilable(String),
              api_key_id: String
            ).returns(
              Anthropic::Beta::Organization::BetaAnalyticsActor::Variants
            )
          end
          def self.new(
            type:,
            # True when the account has been deleted, or when the user is no longer a member
            # of the organization or its associated organizations (for example, their
            # membership was removed or they were deprovisioned via your identity provider).
            # `email_address` stays populated for removed users and is null when the account
            # has been deleted. `name` follows the rules described on that field. The
            # `user_id` is still populated for reconciliation.
            deleted: nil,
            # The user's current email address, including for users who are no longer members
            # of the organization. Null when the account has been deleted and for
            # system-minted service accounts.
            email_address: nil,
            # The user's current full name. Null when the user has not set one.
            # `"Deleted User"` when the account has been deleted, or when the user is no
            # longer a member and the organization hides removed users' names.
            name: nil,
            # Tagged user ID.
            user_id: nil,
            # Tagged service account ID.
            service_account_id: nil,
            # The trusted provider that asserted the caller's identity.
            provider: nil,
            # The provider's identifier for the caller: on `aws`, the IAM principal ARN (one
            # role is one actor across its sessions); on `gcp`, the caller's IAM principal
            # identifier as Google Cloud reports it, such as `serviceAccount:<email>`,
            # `user:<email>`, or a `principal://...` URI.
            subject: nil,
            # Tagged API key ID.
            api_key_id: nil
          )
          end
        end
      end
    end
  end
end

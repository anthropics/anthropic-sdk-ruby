# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # Who sent a message.
          module BetaComplianceReviewActor
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewUserActor,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewAPIActor,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER_ACTOR =
                T.let(
                  :user_actor,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Type::TaggedSymbol
                )
              API_ACTOR =
                T.let(
                  :api_actor,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Type::TaggedSymbol
                )
              SERVICE_ACCOUNT_ACTOR =
                T.let(
                  :service_account_actor,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Variants
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
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Type::OrSymbol,
                email_address: T.nilable(String),
                user_id: String,
                api_key_id: String,
                service_account_id: String
              ).returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Variants
              )
            end
            def self.new(
              type:,
              # The user's email address. Set only for a current member of an organization that
              # the API key can read.
              email_address: nil,
              # The ID of the user (`user_...`).
              user_id: nil,
              # The ID of the API key (`apikey_...`).
              api_key_id: nil,
              # The ID of the service account (`svac_...`).
              service_account_id: nil
            )
            end
          end
        end
      end
    end
  end
end

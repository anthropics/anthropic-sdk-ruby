# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewVerdictParam < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewVerdictParam,
                  Anthropic::Internal::AnyHash
                )
              end

            # Your conclusion on this message.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::OrSymbol
              )
            end
            attr_accessor :determination

            # The `item_id` of one of the case's `transcripts`.
            sig { returns(String) }
            attr_accessor :item_id

            # The policy category that this message violated, from the values that the
            # request's `policy_categories` accepts. Optional with `violation`. Leave it out
            # with `no_violation`.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::OrSymbol
                )
              )
            end
            attr_accessor :policy_category

            # Your conclusion on one message of a review case.
            sig do
              params(
                determination:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::OrSymbol,
                item_id: String,
                policy_category:
                  T.nilable(
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::OrSymbol
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Your conclusion on this message.
              determination:,
              # The `item_id` of one of the case's `transcripts`.
              item_id:,
              # The policy category that this message violated, from the values that the
              # request's `policy_categories` accepts. Optional with `violation`. Leave it out
              # with `no_violation`.
              policy_category: nil
            )
            end

            sig do
              override.returns(
                {
                  determination:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::OrSymbol,
                  item_id: String,
                  policy_category:
                    T.nilable(
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::OrSymbol
                    )
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
end

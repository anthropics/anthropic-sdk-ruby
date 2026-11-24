# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewTranscript < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewTranscript,
                  Anthropic::Internal::AnyHash
                )
              end

            # The ID of the flagged message.
            sig { returns(String) }
            attr_accessor :item_id

            # The ID of the user profile that the message belongs to. Null when the message
            # belongs to none, or when the profile can no longer be looked up.
            sig { returns(T.nilable(String)) }
            attr_accessor :user_profile_id

            # One flagged message of a review case.
            sig do
              params(
                item_id: String,
                user_profile_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The ID of the flagged message.
              item_id:,
              # The ID of the user profile that the message belongs to. Null when the message
              # belongs to none, or when the profile can no longer be looked up.
              user_profile_id:
            )
            end

            sig do
              override.returns(
                { item_id: String, user_profile_id: T.nilable(String) }
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

# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewItem < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewItem,
                  Anthropic::Internal::AnyHash
                )
              end

            # The ID of the item. For a message, its own ID, such as `msg_...`.
            sig { returns(String) }
            attr_accessor :id

            # For a message, who sent it. Null when no sender was recorded. New types can
            # appear, so accept a type that you don't know.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Variants
                )
              )
            end
            attr_accessor :actor

            # Read the item, and save any copy you need, by this time. The item can stop being
            # readable sooner.
            sig { returns(Time) }
            attr_accessor :content_expires_at

            # For a message, when Anthropic received the call.
            sig { returns(Time) }
            attr_accessor :created_at

            # What is particular to this kind of item. New types can appear, so accept a type
            # that you don't know.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewMessageDetails
              )
            end
            attr_reader :details

            sig do
              params(
                details:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewMessageDetails::OrHash
              ).void
            end
            attr_writer :details

            # The UUID of the organization that the item belongs to. For a message, the
            # organization that sent it.
            sig { returns(String) }
            attr_accessor :organization_id

            # Why the item is readable. New types can appear, so accept a type that you don't
            # know.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason
              )
            end
            attr_reader :read_reason

            sig do
              params(
                read_reason:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason::OrHash
              ).void
            end
            attr_writer :read_reason

            # The object type, always `compliance_review_item`.
            sig { returns(Symbol) }
            attr_accessor :type

            # The ID of the user profile that the item was attributed to (`uprof_...`). Null
            # when none was recorded.
            sig { returns(T.nilable(String)) }
            attr_accessor :user_profile_id

            # The ID of the workspace (`wrkspc_...`). Null when the item isn't attributed to a
            # workspace.
            sig { returns(T.nilable(String)) }
            attr_accessor :workspace_id

            # One stored item that the organization it belongs to can read for review.
            sig do
              params(
                id: String,
                actor:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewUserActor::OrHash,
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewAPIActor::OrHash,
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor::OrHash
                    )
                  ),
                content_expires_at: Time,
                created_at: Time,
                details:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewMessageDetails::OrHash,
                organization_id: String,
                read_reason:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason::OrHash,
                user_profile_id: T.nilable(String),
                workspace_id: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The ID of the item. For a message, its own ID, such as `msg_...`.
              id:,
              # For a message, who sent it. Null when no sender was recorded. New types can
              # appear, so accept a type that you don't know.
              actor:,
              # Read the item, and save any copy you need, by this time. The item can stop being
              # readable sooner.
              content_expires_at:,
              # For a message, when Anthropic received the call.
              created_at:,
              # What is particular to this kind of item. New types can appear, so accept a type
              # that you don't know.
              details:,
              # The UUID of the organization that the item belongs to. For a message, the
              # organization that sent it.
              organization_id:,
              # Why the item is readable. New types can appear, so accept a type that you don't
              # know.
              read_reason:,
              # The ID of the user profile that the item was attributed to (`uprof_...`). Null
              # when none was recorded.
              user_profile_id:,
              # The ID of the workspace (`wrkspc_...`). Null when the item isn't attributed to a
              # workspace.
              workspace_id:,
              # The object type, always `compliance_review_item`.
              type: :compliance_review_item
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  actor:
                    T.nilable(
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor::Variants
                    ),
                  content_expires_at: Time,
                  created_at: Time,
                  details:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewMessageDetails,
                  organization_id: String,
                  read_reason:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason,
                  type: Symbol,
                  user_profile_id: T.nilable(String),
                  workspace_id: T.nilable(String)
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

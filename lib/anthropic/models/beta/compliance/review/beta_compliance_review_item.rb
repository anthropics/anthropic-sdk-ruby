# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # @see Anthropic::Resources::Beta::Compliance::Review::Items#retrieve
          class BetaComplianceReviewItem < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   The ID of the item. For a message, its own ID, such as `msg_...`.
            #
            #   @return [String]
            required :id, String

            # @!attribute actor
            #   For a message, who sent it. Null when no sender was recorded. New types can
            #   appear, so accept a type that you don't know.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewUserActor, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewAPIActor, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor, nil]
            required :actor,
                     union: -> {
                       Anthropic::Beta::Compliance::Review::BetaComplianceReviewActor
                     },
                     nil?: true

            # @!attribute content_expires_at
            #   Read the item, and save any copy you need, by this time. The item can stop being
            #   readable sooner.
            #
            #   @return [Time]
            required :content_expires_at, Time

            # @!attribute created_at
            #   For a message, when Anthropic received the call.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute details
            #   What is particular to this kind of item. New types can appear, so accept a type
            #   that you don't know.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewMessageDetails]
            required :details, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewMessageDetails }

            # @!attribute organization_id
            #   The UUID of the organization that the item belongs to. For a message, the
            #   organization that sent it.
            #
            #   @return [String]
            required :organization_id, String

            # @!attribute read_reason
            #   Why the item is readable. New types can appear, so accept a type that you don't
            #   know.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason]
            required :read_reason, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason }

            # @!attribute type
            #   The object type, always `compliance_review_item`.
            #
            #   @return [Symbol, :compliance_review_item]
            required :type, const: :compliance_review_item

            # @!attribute user_profile_id
            #   The ID of the user profile that the item was attributed to (`uprof_...`). Null
            #   when none was recorded.
            #
            #   @return [String, nil]
            required :user_profile_id, String, nil?: true

            # @!attribute workspace_id
            #   The ID of the workspace (`wrkspc_...`). Null when the item isn't attributed to a
            #   workspace.
            #
            #   @return [String, nil]
            required :workspace_id, String, nil?: true

            # @!method initialize(id:, actor:, content_expires_at:, created_at:, details:, organization_id:, read_reason:, user_profile_id:, workspace_id:, type: :compliance_review_item)
            #   One stored item that the organization it belongs to can read for review.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewItem} for more
            #   details.
            #
            #   @param id [String] The ID of the item. For a message, its own ID, such as `msg_...`.
            #
            #   @param actor [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewUserActor, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewAPIActor, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor, nil] For a message, who sent it. Null when no sender was recorded. New types can appe
            #
            #   @param content_expires_at [Time] Read the item, and save any copy you need, by this time. The item can stop being
            #
            #   @param created_at [Time] For a message, when Anthropic received the call.
            #
            #   @param details [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewMessageDetails] What is particular to this kind of item. New types can appear, so accept a type
            #
            #   @param organization_id [String] The UUID of the organization that the item belongs to. For a message, the organi
            #
            #   @param read_reason [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewSafeguardsReason] Why the item is readable. New types can appear, so accept a type that you don't
            #
            #   @param user_profile_id [String, nil] The ID of the user profile that the item was attributed to (`uprof_...`). Null w
            #
            #   @param workspace_id [String, nil] The ID of the workspace (`wrkspc_...`). Null when the item isn't attributed to a
            #
            #   @param type [Symbol, :compliance_review_item] The object type, always `compliance_review_item`.
          end
        end
      end
    end
  end
end

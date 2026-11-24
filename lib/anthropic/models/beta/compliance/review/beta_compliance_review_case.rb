# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # @see Anthropic::Resources::Beta::Compliance::Review::Cases#retrieve
          class BetaComplianceReviewCase < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   The unique ID of the case (`rvc_...`).
            #
            #   @return [String]
            required :id, String

            # @!attribute created_at
            #   When Anthropic sent the case. The time you have to respond starts here.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute enforcement_action
            #   The action that Anthropic took before it sent the case. Null when it took none.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction, nil]
            required :enforcement_action,
                     -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction },
                     nil?: true

            # @!attribute organization_id
            #   The UUID of the organization that sent the flagged messages, which the case
            #   belongs to.
            #
            #   @return [String]
            required :organization_id, String

            # @!attribute policy_categories
            #   Anthropic's labels for why the messages were flagged, such as `cyber` or
            #   `fraud`. There is at least one. New values can appear, so accept a value that
            #   you don't know.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory>]
            required :policy_categories,
                     -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory] }

            # @!attribute status
            #   Whether Anthropic is still waiting for a response.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseOpen, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseClosed]
            required :status, union: -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus }

            # @!attribute transcripts
            #   The flagged messages. There is at least one, and the list isn't paginated.
            #
            #   @return [Array<Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewTranscript>]
            required :transcripts,
                     -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Compliance::Review::BetaComplianceReviewTranscript] }

            # @!attribute type
            #   The object type, always `compliance_review_case`.
            #
            #   @return [Symbol, :compliance_review_case]
            required :type, const: :compliance_review_case

            # @!attribute updated_at
            #   When the case last changed. It changes when Anthropic sends the case, when the
            #   case closes, and when Anthropic sends a notice about the case.
            #
            #   @return [Time]
            required :updated_at, Time

            # @!attribute workspace_id
            #   The ID of the workspace that sent the flagged messages (`wrkspc_...`). Null when
            #   the messages have no workspace, and it can be null for the default workspace.
            #
            #   @return [String, nil]
            required :workspace_id, String, nil?: true

            # @!method initialize(id:, created_at:, enforcement_action:, organization_id:, policy_categories:, status:, transcripts:, updated_at:, workspace_id:, type: :compliance_review_case)
            #   A record of an organization's messages that Anthropic flagged and sent to the
            #   organization to review. It lists the messages by ID and doesn't include their
            #   content.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCase} for more
            #   details.
            #
            #   @param id [String] The unique ID of the case (`rvc_...`).
            #
            #   @param created_at [Time] When Anthropic sent the case. The time you have to respond starts here.
            #
            #   @param enforcement_action [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction, nil] The action that Anthropic took before it sent the case. Null when it took none.
            #
            #   @param organization_id [String] The UUID of the organization that sent the flagged messages, which the case belo
            #
            #   @param policy_categories [Array<Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory>] Anthropic's labels for why the messages were flagged, such as `cyber` or `fraud`
            #
            #   @param status [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseOpen, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseClosed] Whether Anthropic is still waiting for a response.
            #
            #   @param transcripts [Array<Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewTranscript>] The flagged messages. There is at least one, and the list isn't paginated.
            #
            #   @param updated_at [Time] When the case last changed. It changes when Anthropic sends the case, when the c
            #
            #   @param workspace_id [String, nil] The ID of the workspace that sent the flagged messages (`wrkspc_...`). Null when
            #
            #   @param type [Symbol, :compliance_review_case] The object type, always `compliance_review_case`.
          end
        end
      end
    end
  end
end

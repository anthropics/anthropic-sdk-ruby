# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookSessionOutcomeEvaluationEndedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the resource that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"session.outcome_evaluation_ended"]
        required :type, const: :"session.outcome_evaluation_ended"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"session.outcome_evaluation_ended")
        #   @param id [String] ID of the resource that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"session.outcome_evaluation_ended"]
      end
    end

    BetaWebhookSessionOutcomeEvaluationEndedEventData =
      Beta::BetaWebhookSessionOutcomeEvaluationEndedEventData
  end
end

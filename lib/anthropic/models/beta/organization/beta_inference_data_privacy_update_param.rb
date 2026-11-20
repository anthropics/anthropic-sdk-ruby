# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInferenceDataPrivacyUpdateParam < Anthropic::Internal::Type::BaseModel
          # @!attribute human_review
          #   Whether Anthropic's human review applies to the Workspace from now on.
          #   `disabled` needs Anthropic's approval. When omitted, unchanged. Cannot be null.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnthropicHumanReviewParam, nil]
          optional :human_review, -> { Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam }

          # @!attribute safeguards_storage
          #   Where the data Anthropic's safeguards systems retain for the Workspace goes once
          #   the change takes effect. `external` sends it to the External Storage that
          #   `external_storage_id` names. `internal` means no External Storage: it goes to
          #   Anthropic's storage or, on a cloud provider's platform, to that provider's
          #   storage. When omitted, unchanged. Cannot be null.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam, nil]
          optional :safeguards_storage, union: -> { Anthropic::Beta::Organization::BetaStorageMemberParam }

          # @!attribute transcripts_storage
          #   Where copies of the Workspace's transcripts and its cases (Anthropic's safety
          #   findings about those transcripts) go once the change takes effect. `external`
          #   sends them to the External Storage that `external_storage_id` names. `internal`
          #   means no External Storage, so no more copies are made. When omitted, unchanged.
          #   Cannot be null.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam, nil]
          optional :transcripts_storage, union: -> { Anthropic::Beta::Organization::BetaStorageMemberParam }

          # @!method initialize(human_review: nil, safeguards_storage: nil, transcripts_storage: nil)
          #   Changes to where the Workspace's retained inference data and transcript copies
          #   go, and to whether Anthropic's human review applies. An omitted member is
          #   unchanged; a member cannot be null.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaInferenceDataPrivacyUpdateParam} for
          #   more details.
          #
          #   @param human_review [Anthropic::Models::Beta::Organization::BetaAnthropicHumanReviewParam] Whether Anthropic's human review applies to the Workspace from now on.
          #
          #   @param safeguards_storage [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam] Where the data Anthropic's safeguards systems retain for the Workspace goes once
          #
          #   @param transcripts_storage [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam] Where copies of the Workspace's transcripts and its cases (Anthropic's safety fi
        end
      end
    end
  end
end

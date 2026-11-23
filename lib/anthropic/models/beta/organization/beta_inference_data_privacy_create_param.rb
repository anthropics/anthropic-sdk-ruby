# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInferenceDataPrivacyCreateParam < Anthropic::Internal::Type::BaseModel
          # @!attribute human_review
          #   Whether Anthropic's human review applies to the Workspace. `disabled` needs
          #   Anthropic's approval. When omitted, `enabled`. Cannot be null.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnthropicHumanReviewParam, nil]
          optional :human_review, -> { Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam }

          # @!attribute safeguards_storage
          #   Where the data Anthropic's safeguards systems retain for the Workspace goes.
          #   `external` sends it, once the attach takes effect, to the External Storage that
          #   `external_storage_id` names. `internal` means no External Storage: it goes to
          #   Anthropic's storage or, on a cloud provider's platform, to that provider's
          #   storage. When omitted, `internal`. Cannot be null.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam, nil]
          optional :safeguards_storage, union: -> { Anthropic::Beta::Organization::BetaStorageMemberParam }

          # @!attribute transcripts_storage
          #   Where copies of the Workspace's transcripts and its cases (Anthropic's safety
          #   findings about those transcripts) go. `external` sends them, once the attach
          #   takes effect, to the External Storage that `external_storage_id` names.
          #   `internal` means no External Storage, so no copies are made. When omitted,
          #   `internal`. Cannot be null.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam, nil]
          optional :transcripts_storage, union: -> { Anthropic::Beta::Organization::BetaStorageMemberParam }

          # @!method initialize(human_review: nil, safeguards_storage: nil, transcripts_storage: nil)
          #   Where the Workspace's retained inference data and transcript copies go, and
          #   whether Anthropic's human review applies. A member cannot be null; omit it
          #   instead.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaInferenceDataPrivacyCreateParam} for
          #   more details.
          #
          #   @param human_review [Anthropic::Models::Beta::Organization::BetaAnthropicHumanReviewParam] Whether Anthropic's human review applies to the Workspace. `disabled` needs Anth
          #
          #   @param safeguards_storage [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam] Where the data Anthropic's safeguards systems retain for the Workspace goes.
          #
          #   @param transcripts_storage [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam] Where copies of the Workspace's transcripts and its cases (Anthropic's safety fi
        end
      end
    end
  end
end

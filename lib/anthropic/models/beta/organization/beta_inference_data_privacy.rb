# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInferenceDataPrivacy < Anthropic::Internal::Type::BaseModel
          # @!attribute human_review
          #   The Workspace's human review setting. Human review is off only while this is
          #   `disabled` and Anthropic's approval stands.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnthropicHumanReview, nil]
          optional :human_review, -> { Anthropic::Beta::Organization::BetaAnthropicHumanReview }

          # @!attribute safeguards_storage
          #   Where the data Anthropic's safeguards systems retain for the Workspace goes.
          #   `external` sends it to the External Storage that `external_storage_id` names.
          #   `internal` means no External Storage: it goes to Anthropic's storage or, on a
          #   cloud provider's platform, to that provider's storage. A recent change may not
          #   have taken effect yet.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaInternalStorage, Anthropic::Models::Beta::Organization::BetaExternalStorageMember, nil]
          optional :safeguards_storage, union: -> { Anthropic::Beta::Organization::BetaStorageMember }

          # @!attribute transcripts_storage
          #   Where copies of the Workspace's transcripts and its cases (Anthropic's safety
          #   findings about those transcripts) go. `external` sends them to the External
          #   Storage that `external_storage_id` names. `internal` means no External Storage,
          #   so no copies are made. A recent change may not have taken effect yet.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaInternalStorage, Anthropic::Models::Beta::Organization::BetaExternalStorageMember, nil]
          optional :transcripts_storage, union: -> { Anthropic::Beta::Organization::BetaStorageMember }

          # @!method initialize(human_review: nil, safeguards_storage: nil, transcripts_storage: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaInferenceDataPrivacy} for more
          #   details.
          #
          #   @param human_review [Anthropic::Models::Beta::Organization::BetaAnthropicHumanReview] The Workspace's human review setting. Human review is off only while this is
          #
          #   @param safeguards_storage [Anthropic::Models::Beta::Organization::BetaInternalStorage, Anthropic::Models::Beta::Organization::BetaExternalStorageMember] Where the data Anthropic's safeguards systems retain for the Workspace goes.
          #
          #   @param transcripts_storage [Anthropic::Models::Beta::Organization::BetaInternalStorage, Anthropic::Models::Beta::Organization::BetaExternalStorageMember] Where copies of the Workspace's transcripts and its cases (Anthropic's safety fi
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInferenceDataPrivacy < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaInferenceDataPrivacy,
                Anthropic::Internal::AnyHash
              )
            end

          # The Workspace's human review setting. Human review is off only while this is
          # `disabled` and Anthropic's approval stands.
          sig do
            returns(
              T.nilable(Anthropic::Beta::Organization::BetaAnthropicHumanReview)
            )
          end
          attr_reader :human_review

          sig do
            params(
              human_review:
                Anthropic::Beta::Organization::BetaAnthropicHumanReview::OrHash
            ).void
          end
          attr_writer :human_review

          # Where the data Anthropic's safeguards systems retain for the Workspace goes.
          # `external` sends it to the External Storage that `external_storage_id` names.
          # `internal` means no External Storage: it goes to Anthropic's storage or, on a
          # cloud provider's platform, to that provider's storage. A recent change may not
          # have taken effect yet.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaStorageMember::Variants
              )
            )
          end
          attr_reader :safeguards_storage

          sig do
            params(
              safeguards_storage:
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorage::OrHash,
                  Anthropic::Beta::Organization::BetaExternalStorageMember::OrHash
                )
            ).void
          end
          attr_writer :safeguards_storage

          # Where copies of the Workspace's transcripts and its cases (Anthropic's safety
          # findings about those transcripts) go. `external` sends them to the External
          # Storage that `external_storage_id` names. `internal` means no External Storage,
          # so no copies are made. A recent change may not have taken effect yet.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaStorageMember::Variants
              )
            )
          end
          attr_reader :transcripts_storage

          sig do
            params(
              transcripts_storage:
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorage::OrHash,
                  Anthropic::Beta::Organization::BetaExternalStorageMember::OrHash
                )
            ).void
          end
          attr_writer :transcripts_storage

          sig do
            params(
              human_review:
                Anthropic::Beta::Organization::BetaAnthropicHumanReview::OrHash,
              safeguards_storage:
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorage::OrHash,
                  Anthropic::Beta::Organization::BetaExternalStorageMember::OrHash
                ),
              transcripts_storage:
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorage::OrHash,
                  Anthropic::Beta::Organization::BetaExternalStorageMember::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The Workspace's human review setting. Human review is off only while this is
            # `disabled` and Anthropic's approval stands.
            human_review: nil,
            # Where the data Anthropic's safeguards systems retain for the Workspace goes.
            # `external` sends it to the External Storage that `external_storage_id` names.
            # `internal` means no External Storage: it goes to Anthropic's storage or, on a
            # cloud provider's platform, to that provider's storage. A recent change may not
            # have taken effect yet.
            safeguards_storage: nil,
            # Where copies of the Workspace's transcripts and its cases (Anthropic's safety
            # findings about those transcripts) go. `external` sends them to the External
            # Storage that `external_storage_id` names. `internal` means no External Storage,
            # so no copies are made. A recent change may not have taken effect yet.
            transcripts_storage: nil
          )
          end

          sig do
            override.returns(
              {
                human_review:
                  Anthropic::Beta::Organization::BetaAnthropicHumanReview,
                safeguards_storage:
                  Anthropic::Beta::Organization::BetaStorageMember::Variants,
                transcripts_storage:
                  Anthropic::Beta::Organization::BetaStorageMember::Variants
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

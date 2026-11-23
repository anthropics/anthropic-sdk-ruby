# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInferenceDataPrivacyCreateParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaInferenceDataPrivacyCreateParam,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether Anthropic's human review applies to the Workspace. `disabled` needs
          # Anthropic's approval. When omitted, `enabled`. Cannot be null.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam
              )
            )
          end
          attr_reader :human_review

          sig do
            params(
              human_review:
                Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::OrHash
            ).void
          end
          attr_writer :human_review

          # Where the data Anthropic's safeguards systems retain for the Workspace goes.
          # `external` sends it, once the attach takes effect, to the External Storage that
          # `external_storage_id` names. `internal` means no External Storage: it goes to
          # Anthropic's storage or, on a cloud provider's platform, to that provider's
          # storage. When omitted, `internal`. Cannot be null.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorageParam,
                  Anthropic::Beta::Organization::BetaExternalStorageMemberParam
                )
              )
            )
          end
          attr_reader :safeguards_storage

          sig do
            params(
              safeguards_storage:
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorageParam::OrHash,
                  Anthropic::Beta::Organization::BetaExternalStorageMemberParam::OrHash
                )
            ).void
          end
          attr_writer :safeguards_storage

          # Where copies of the Workspace's transcripts and its cases (Anthropic's safety
          # findings about those transcripts) go. `external` sends them, once the attach
          # takes effect, to the External Storage that `external_storage_id` names.
          # `internal` means no External Storage, so no copies are made. When omitted,
          # `internal`. Cannot be null.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorageParam,
                  Anthropic::Beta::Organization::BetaExternalStorageMemberParam
                )
              )
            )
          end
          attr_reader :transcripts_storage

          sig do
            params(
              transcripts_storage:
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorageParam::OrHash,
                  Anthropic::Beta::Organization::BetaExternalStorageMemberParam::OrHash
                )
            ).void
          end
          attr_writer :transcripts_storage

          # Where the Workspace's retained inference data and transcript copies go, and
          # whether Anthropic's human review applies. A member cannot be null; omit it
          # instead.
          sig do
            params(
              human_review:
                Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::OrHash,
              safeguards_storage:
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorageParam::OrHash,
                  Anthropic::Beta::Organization::BetaExternalStorageMemberParam::OrHash
                ),
              transcripts_storage:
                T.any(
                  Anthropic::Beta::Organization::BetaInternalStorageParam::OrHash,
                  Anthropic::Beta::Organization::BetaExternalStorageMemberParam::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether Anthropic's human review applies to the Workspace. `disabled` needs
            # Anthropic's approval. When omitted, `enabled`. Cannot be null.
            human_review: nil,
            # Where the data Anthropic's safeguards systems retain for the Workspace goes.
            # `external` sends it, once the attach takes effect, to the External Storage that
            # `external_storage_id` names. `internal` means no External Storage: it goes to
            # Anthropic's storage or, on a cloud provider's platform, to that provider's
            # storage. When omitted, `internal`. Cannot be null.
            safeguards_storage: nil,
            # Where copies of the Workspace's transcripts and its cases (Anthropic's safety
            # findings about those transcripts) go. `external` sends them, once the attach
            # takes effect, to the External Storage that `external_storage_id` names.
            # `internal` means no External Storage, so no copies are made. When omitted,
            # `internal`. Cannot be null.
            transcripts_storage: nil
          )
          end

          sig do
            override.returns(
              {
                human_review:
                  Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam,
                safeguards_storage:
                  T.any(
                    Anthropic::Beta::Organization::BetaInternalStorageParam,
                    Anthropic::Beta::Organization::BetaExternalStorageMemberParam
                  ),
                transcripts_storage:
                  T.any(
                    Anthropic::Beta::Organization::BetaInternalStorageParam,
                    Anthropic::Beta::Organization::BetaExternalStorageMemberParam
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

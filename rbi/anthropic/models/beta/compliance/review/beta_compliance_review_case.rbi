# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCase < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase,
                  Anthropic::Internal::AnyHash
                )
              end

            # The unique ID of the case (`rvc_...`).
            sig { returns(String) }
            attr_accessor :id

            # When Anthropic sent the case. The time you have to respond starts here.
            sig { returns(Time) }
            attr_accessor :created_at

            # The action that Anthropic took before it sent the case. Null when it took none.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction
                )
              )
            end
            attr_reader :enforcement_action

            sig do
              params(
                enforcement_action:
                  T.nilable(
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction::OrHash
                  )
              ).void
            end
            attr_writer :enforcement_action

            # The UUID of the organization that sent the flagged messages, which the case
            # belongs to.
            sig { returns(String) }
            attr_accessor :organization_id

            # Anthropic's labels for why the messages were flagged, such as `cyber` or
            # `fraud`. There is at least one. New values can appear, so accept a value that
            # you don't know.
            sig do
              returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
                ]
              )
            end
            attr_accessor :policy_categories

            # Whether Anthropic is still waiting for a response.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Variants
              )
            end
            attr_accessor :status

            # The flagged messages. There is at least one, and the list isn't paginated.
            sig do
              returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewTranscript
                ]
              )
            end
            attr_accessor :transcripts

            # The object type, always `compliance_review_case`.
            sig { returns(Symbol) }
            attr_accessor :type

            # When the case last changed. It changes when Anthropic sends the case, when the
            # case closes, and when Anthropic sends a notice about the case.
            sig { returns(Time) }
            attr_accessor :updated_at

            # The ID of the workspace that sent the flagged messages (`wrkspc_...`). Null when
            # the messages have no workspace, and it can be null for the default workspace.
            sig { returns(T.nilable(String)) }
            attr_accessor :workspace_id

            # A record of an organization's messages that Anthropic flagged and sent to the
            # organization to review. It lists the messages by ID and doesn't include their
            # content.
            sig do
              params(
                id: String,
                created_at: Time,
                enforcement_action:
                  T.nilable(
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction::OrHash
                  ),
                organization_id: String,
                policy_categories:
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::OrSymbol
                  ],
                status:
                  T.any(
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOpen::OrHash,
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseClosed::OrHash
                  ),
                transcripts:
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewTranscript::OrHash
                  ],
                updated_at: Time,
                workspace_id: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The unique ID of the case (`rvc_...`).
              id:,
              # When Anthropic sent the case. The time you have to respond starts here.
              created_at:,
              # The action that Anthropic took before it sent the case. Null when it took none.
              enforcement_action:,
              # The UUID of the organization that sent the flagged messages, which the case
              # belongs to.
              organization_id:,
              # Anthropic's labels for why the messages were flagged, such as `cyber` or
              # `fraud`. There is at least one. New values can appear, so accept a value that
              # you don't know.
              policy_categories:,
              # Whether Anthropic is still waiting for a response.
              status:,
              # The flagged messages. There is at least one, and the list isn't paginated.
              transcripts:,
              # When the case last changed. It changes when Anthropic sends the case, when the
              # case closes, and when Anthropic sends a notice about the case.
              updated_at:,
              # The ID of the workspace that sent the flagged messages (`wrkspc_...`). Null when
              # the messages have no workspace, and it can be null for the default workspace.
              workspace_id:,
              # The object type, always `compliance_review_case`.
              type: :compliance_review_case
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  created_at: Time,
                  enforcement_action:
                    T.nilable(
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction
                    ),
                  organization_id: String,
                  policy_categories:
                    T::Array[
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
                    ],
                  status:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Variants,
                  transcripts:
                    T::Array[
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewTranscript
                    ],
                  type: Symbol,
                  updated_at: Time,
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

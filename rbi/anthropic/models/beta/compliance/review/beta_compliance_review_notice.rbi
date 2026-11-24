# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewNotice < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNotice,
                  Anthropic::Internal::AnyHash
                )
              end

            # The unique ID of the notice (`rvn_...`).
            sig { returns(String) }
            attr_accessor :id

            # The IDs of the cases that the notice is about (`rvc_...`). Empty when the notice
            # is about the whole organization.
            sig { returns(T::Array[String]) }
            attr_accessor :case_ids

            # When Anthropic sent the notice.
            sig { returns(Time) }
            attr_accessor :created_at

            # What kind of notice this is.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind
              )
            end
            attr_reader :kind

            sig do
              params(
                kind:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::OrHash
              ).void
            end
            attr_writer :kind

            # The text of the notice.
            sig { returns(String) }
            attr_accessor :message

            # The UUID of the organization that the notice is for.
            sig { returns(String) }
            attr_accessor :organization_id

            # The time by which Anthropic asks for an answer. Null when there is no deadline.
            # Missing it changes nothing on a case, and the time to respond to a case can end
            # before it.
            sig { returns(T.nilable(Time)) }
            attr_accessor :respond_by

            # The object type, always `compliance_review_notice`.
            sig { returns(Symbol) }
            attr_accessor :type

            # A message from Anthropic to an organization about its review cases or about the
            # organization as a whole, such as a request to respond by a date, a warning, or a
            # question. A notice doesn't change after Anthropic sends it.
            sig do
              params(
                id: String,
                case_ids: T::Array[String],
                created_at: Time,
                kind:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind::OrHash,
                message: String,
                organization_id: String,
                respond_by: T.nilable(Time),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The unique ID of the notice (`rvn_...`).
              id:,
              # The IDs of the cases that the notice is about (`rvc_...`). Empty when the notice
              # is about the whole organization.
              case_ids:,
              # When Anthropic sent the notice.
              created_at:,
              # What kind of notice this is.
              kind:,
              # The text of the notice.
              message:,
              # The UUID of the organization that the notice is for.
              organization_id:,
              # The time by which Anthropic asks for an answer. Null when there is no deadline.
              # Missing it changes nothing on a case, and the time to respond to a case can end
              # before it.
              respond_by:,
              # The object type, always `compliance_review_notice`.
              type: :compliance_review_notice
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  case_ids: T::Array[String],
                  created_at: Time,
                  kind:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind,
                  message: String,
                  organization_id: String,
                  respond_by: T.nilable(Time),
                  type: Symbol
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

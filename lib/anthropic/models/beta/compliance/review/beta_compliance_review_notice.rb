# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # @see Anthropic::Resources::Beta::Compliance::Review::Notices#list
          class BetaComplianceReviewNotice < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   The unique ID of the notice (`rvn_...`).
            #
            #   @return [String]
            required :id, String

            # @!attribute case_ids
            #   The IDs of the cases that the notice is about (`rvc_...`). Empty when the notice
            #   is about the whole organization.
            #
            #   @return [Array<String>]
            required :case_ids, Anthropic::Internal::Type::ArrayOf[String]

            # @!attribute created_at
            #   When Anthropic sent the notice.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute kind
            #   What kind of notice this is.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewNoticeKind]
            required :kind, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewNoticeKind }

            # @!attribute message
            #   The text of the notice.
            #
            #   @return [String]
            required :message, String

            # @!attribute organization_id
            #   The UUID of the organization that the notice is for.
            #
            #   @return [String]
            required :organization_id, String

            # @!attribute respond_by
            #   The time by which Anthropic asks for an answer. Null when there is no deadline.
            #   Missing it changes nothing on a case, and the time to respond to a case can end
            #   before it.
            #
            #   @return [Time, nil]
            required :respond_by, Time, nil?: true

            # @!attribute type
            #   The object type, always `compliance_review_notice`.
            #
            #   @return [Symbol, :compliance_review_notice]
            required :type, const: :compliance_review_notice

            # @!method initialize(id:, case_ids:, created_at:, kind:, message:, organization_id:, respond_by:, type: :compliance_review_notice)
            #   A message from Anthropic to an organization about its review cases or about the
            #   organization as a whole, such as a request to respond by a date, a warning, or a
            #   question. A notice doesn't change after Anthropic sends it.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewNotice} for
            #   more details.
            #
            #   @param id [String] The unique ID of the notice (`rvn_...`).
            #
            #   @param case_ids [Array<String>] The IDs of the cases that the notice is about (`rvc_...`). Empty when the notice
            #
            #   @param created_at [Time] When Anthropic sent the notice.
            #
            #   @param kind [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewNoticeKind] What kind of notice this is.
            #
            #   @param message [String] The text of the notice.
            #
            #   @param organization_id [String] The UUID of the organization that the notice is for.
            #
            #   @param respond_by [Time, nil] The time by which Anthropic asks for an answer. Null when there is no deadline.
            #
            #   @param type [Symbol, :compliance_review_notice] The object type, always `compliance_review_notice`.
          end
        end
      end
    end
  end
end

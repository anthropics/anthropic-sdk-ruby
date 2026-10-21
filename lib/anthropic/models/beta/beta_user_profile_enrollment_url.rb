# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#create_enrollment_url
      class BetaUserProfileEnrollmentURL < Anthropic::Internal::Type::BaseModel
        # @!attribute expires_at
        #   When this enrollment URL expires, in RFC 3339 format.
        #
        #   @return [Time]
        required :expires_at, Time

        # @!attribute type
        #   Object type. Always `enrollment_url`.
        #
        #   @return [Symbol, :enrollment_url]
        required :type, const: :enrollment_url

        # @!attribute url
        #   Enrollment URL to send to the end user. Valid until `expires_at`.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(expires_at:, url:, type: :enrollment_url)
        #   A URL to give to the entity that a user profile represents, so that the entity
        #   can enroll in a program.
        #
        #   @param expires_at [Time] When this enrollment URL expires, in RFC 3339 format.
        #
        #   @param url [String] Enrollment URL to send to the end user. Valid until `expires_at`.
        #
        #   @param type [Symbol, :enrollment_url] Object type. Always `enrollment_url`.
      end
    end

    BetaUserProfileEnrollmentURL = Beta::BetaUserProfileEnrollmentURL
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#create_enrollment_url
      class BetaUserProfileEnrollmentURL < Anthropic::Internal::Type::BaseModel
        # @!attribute expires_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :expires_at, Time

        # @!attribute type
        #   Object type. Always `enrollment_url`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaUserProfileEnrollmentURL::Type]
        required :type, enum: -> { Anthropic::Beta::BetaUserProfileEnrollmentURL::Type }

        # @!attribute url
        #   Enrollment URL to send to the end user. Valid until `expires_at`.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(expires_at:, type:, url:)
        #   @param expires_at [Time] A timestamp in RFC 3339 format
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaUserProfileEnrollmentURL::Type] Object type. Always `enrollment_url`.
        #
        #   @param url [String] Enrollment URL to send to the end user. Valid until `expires_at`.

        # Object type. Always `enrollment_url`.
        #
        # @see Anthropic::Models::Beta::BetaUserProfileEnrollmentURL#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ENROLLMENT_URL = :enrollment_url

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaUserProfileEnrollmentURL = Beta::BetaUserProfileEnrollmentURL
  end
end

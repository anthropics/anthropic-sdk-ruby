# typed: strong

module Anthropic
  module Models
    BetaUserProfileEnrollmentURL = Beta::BetaUserProfileEnrollmentURL

    module Beta
      class BetaUserProfileEnrollmentURL < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaUserProfileEnrollmentURL,
              Anthropic::Internal::AnyHash
            )
          end

        # When this enrollment URL expires, in RFC 3339 format.
        sig { returns(Time) }
        attr_accessor :expires_at

        # Object type. Always `enrollment_url`.
        sig { returns(Symbol) }
        attr_accessor :type

        # Enrollment URL to send to the end user. Valid until `expires_at`.
        sig { returns(String) }
        attr_accessor :url

        # A URL to give to the entity that a user profile represents, so that the entity
        # can enroll in a program.
        sig do
          params(expires_at: Time, url: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # When this enrollment URL expires, in RFC 3339 format.
          expires_at:,
          # Enrollment URL to send to the end user. Valid until `expires_at`.
          url:,
          # Object type. Always `enrollment_url`.
          type: :enrollment_url
        )
        end

        sig do
          override.returns({ expires_at: Time, type: Symbol, url: String })
        end
        def to_hash
        end
      end
    end
  end
end

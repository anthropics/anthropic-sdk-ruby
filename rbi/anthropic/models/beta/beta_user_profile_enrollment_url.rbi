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

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :expires_at

        # Object type. Always `enrollment_url`.
        sig do
          returns(
            Anthropic::Beta::BetaUserProfileEnrollmentURL::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Enrollment URL to send to the end user. Valid until `expires_at`.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            expires_at: Time,
            type: Anthropic::Beta::BetaUserProfileEnrollmentURL::Type::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # A timestamp in RFC 3339 format
          expires_at:,
          # Object type. Always `enrollment_url`.
          type:,
          # Enrollment URL to send to the end user. Valid until `expires_at`.
          url:
        )
        end

        sig do
          override.returns(
            {
              expires_at: Time,
              type:
                Anthropic::Beta::BetaUserProfileEnrollmentURL::Type::TaggedSymbol,
              url: String
            }
          )
        end
        def to_hash
        end

        # Object type. Always `enrollment_url`.
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaUserProfileEnrollmentURL::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENROLLMENT_URL =
            T.let(
              :enrollment_url,
              Anthropic::Beta::BetaUserProfileEnrollmentURL::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaUserProfileEnrollmentURL::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

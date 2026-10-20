# typed: strong

module Anthropic
  module Models
    class UserProfile < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::UserProfile, Anthropic::Internal::AnyHash)
        end

      # Unique identifier for this user profile, prefixed `uprof_`.
      sig { returns(String) }
      attr_accessor :id

      # How the platform uses the API for this entity: `application` (default) or
      # `passthrough`. Absent under the legacy `user-profiles-2026-03-24` beta header.
      sig { returns(Anthropic::UserProfileAccessType::TaggedSymbol) }
      attr_accessor :access_type

      # When this user profile was created, in RFC 3339 format.
      sig { returns(Time) }
      attr_accessor :created_at

      # Details about the entity this profile represents, as the platform states them;
      # not verified by Anthropic. Every field is present, `null` until the platform
      # supplies a value. Absent under the legacy `user-profiles-2026-03-24` and
      # `user-profiles-2026-08-18` beta headers, which serve `reference_id` as the
      # top-level `external_id` and, under `user-profiles-2026-08-18`, `onboarded_at` as
      # `external_user_onboarded_at`.
      sig { returns(Anthropic::UserProfileExternalUserDetails) }
      attr_reader :external_user_details

      sig do
        params(
          external_user_details:
            Anthropic::UserProfileExternalUserDetails::OrHash
        ).void
      end
      attr_writer :external_user_details

      # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
      # to 512 chars.
      sig { returns(T::Hash[Symbol, String]) }
      attr_accessor :metadata

      # Real-world name of the entity this profile represents (company or individual).
      # For a company the platform resells Claude access to (`access_type`
      # `passthrough`) this is that company's name. `null` until the platform supplies
      # one.
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The profile's standing in each Anthropic program, such as the Cyber Verification
      # Program. Present when the request sends no user-profiles beta header; absent
      # under the `user-profiles-2026-09-04` and earlier beta headers, which serve
      # `trust_grants` instead.
      sig { returns(Anthropic::UserProfilePrograms) }
      attr_reader :programs

      sig { params(programs: Anthropic::UserProfilePrograms::OrHash).void }
      attr_writer :programs

      # Object type. Always `user_profile`.
      sig { returns(Symbol) }
      attr_accessor :type

      # When this user profile was last modified, in RFC 3339 format. It normally also
      # updates shortly after Anthropic gives the profile an approval or withdraws one.
      # Other changes to the statuses that Anthropic reports do not always update it, so
      # read the status itself rather than watching this timestamp.
      sig { returns(Time) }
      attr_accessor :updated_at

      # A record of an entity that the platform serves through the API, such as an
      # end-user of the platform's product or a company that the platform resells Claude
      # access to.
      #
      # A Messages, Message Batches or token counting request can send a profile's `id`
      # in the `anthropic-user-profile-id` header to attribute the request to that
      # entity.
      sig do
        params(
          id: String,
          access_type: Anthropic::UserProfileAccessType::OrSymbol,
          created_at: Time,
          external_user_details:
            Anthropic::UserProfileExternalUserDetails::OrHash,
          metadata: T::Hash[Symbol, String],
          name: T.nilable(String),
          programs: Anthropic::UserProfilePrograms::OrHash,
          updated_at: Time,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for this user profile, prefixed `uprof_`.
        id:,
        # How the platform uses the API for this entity: `application` (default) or
        # `passthrough`. Absent under the legacy `user-profiles-2026-03-24` beta header.
        access_type:,
        # When this user profile was created, in RFC 3339 format.
        created_at:,
        # Details about the entity this profile represents, as the platform states them;
        # not verified by Anthropic. Every field is present, `null` until the platform
        # supplies a value. Absent under the legacy `user-profiles-2026-03-24` and
        # `user-profiles-2026-08-18` beta headers, which serve `reference_id` as the
        # top-level `external_id` and, under `user-profiles-2026-08-18`, `onboarded_at` as
        # `external_user_onboarded_at`.
        external_user_details:,
        # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
        # to 512 chars.
        metadata:,
        # Real-world name of the entity this profile represents (company or individual).
        # For a company the platform resells Claude access to (`access_type`
        # `passthrough`) this is that company's name. `null` until the platform supplies
        # one.
        name:,
        # The profile's standing in each Anthropic program, such as the Cyber Verification
        # Program. Present when the request sends no user-profiles beta header; absent
        # under the `user-profiles-2026-09-04` and earlier beta headers, which serve
        # `trust_grants` instead.
        programs:,
        # When this user profile was last modified, in RFC 3339 format. It normally also
        # updates shortly after Anthropic gives the profile an approval or withdraws one.
        # Other changes to the statuses that Anthropic reports do not always update it, so
        # read the status itself rather than watching this timestamp.
        updated_at:,
        # Object type. Always `user_profile`.
        type: :user_profile
      )
      end

      sig do
        override.returns(
          {
            id: String,
            access_type: Anthropic::UserProfileAccessType::TaggedSymbol,
            created_at: Time,
            external_user_details: Anthropic::UserProfileExternalUserDetails,
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            programs: Anthropic::UserProfilePrograms,
            type: Symbol,
            updated_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end

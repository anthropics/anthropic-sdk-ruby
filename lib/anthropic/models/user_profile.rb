# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::UserProfiles#create
    class UserProfile < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for this user profile, prefixed `uprof_`.
      #
      #   @return [String]
      required :id, String

      # @!attribute access_type
      #   How the platform uses the API for this entity: `application` (default) or
      #   `passthrough`. Absent under the legacy `user-profiles-2026-03-24` beta header.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileAccessType]
      required :access_type, enum: -> { Anthropic::UserProfileAccessType }

      # @!attribute created_at
      #   When this user profile was created, in RFC 3339 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute enforcement_actions
      #   The enforcement actions open on this profile; empty when none is open. Absent
      #   under the `user-profiles-2026-09-04` and earlier beta headers.
      #
      #   @return [Array<Anthropic::Models::UserProfileEnforcementActionRestriction, Anthropic::Models::UserProfileEnforcementActionBan>]
      required :enforcement_actions,
               -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::UserProfileEnforcementAction] }

      # @!attribute enforcement_status
      #   Anthropic's enforcement status of this profile, from its open enforcement
      #   actions and any identity check under review, by the first rule that applies:
      #   `banned` while any open action is a `ban`; `pending` while a restriction that an
      #   identity check can clear is open, the end user has submitted that check,
      #   Anthropic's review of it has not ended, and no open action's `reason` is
      #   `account_compromise`; `restricted` while any action is open; `unrestricted`
      #   while none is. Absent under the `user-profiles-2026-09-04` and earlier beta
      #   headers.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileEnforcementStatus]
      required :enforcement_status, enum: -> { Anthropic::UserProfileEnforcementStatus }

      # @!attribute external_user_details
      #   Details about the entity this profile represents, as the platform states them;
      #   not verified by Anthropic. Every field is present, `null` until the platform
      #   supplies a value. Absent under the legacy `user-profiles-2026-03-24` and
      #   `user-profiles-2026-08-18` beta headers, which serve `reference_id` as the
      #   top-level `external_id` and, under `user-profiles-2026-08-18`, `onboarded_at` as
      #   `external_user_onboarded_at`.
      #
      #   @return [Anthropic::Models::UserProfileExternalUserDetails]
      required :external_user_details, -> { Anthropic::UserProfileExternalUserDetails }

      # @!attribute metadata
      #   Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
      #   to 512 chars.
      #
      #   @return [Hash{Symbol=>String}]
      required :metadata, Anthropic::Internal::Type::HashOf[String]

      # @!attribute name
      #   Real-world name of the entity this profile represents (company or individual).
      #   For a company the platform resells Claude access to (`access_type`
      #   `passthrough`) this is that company's name. `null` until the platform supplies
      #   one.
      #
      #   @return [String, nil]
      required :name, String, nil?: true

      # @!attribute programs
      #   The profile's standing in each Anthropic program, such as the Cyber Verification
      #   Program. Present when the request sends no user-profiles beta header; absent
      #   under the `user-profiles-2026-09-04` and earlier beta headers, which serve
      #   `trust_grants` instead.
      #
      #   @return [Anthropic::Models::UserProfilePrograms]
      required :programs, -> { Anthropic::UserProfilePrograms }

      # @!attribute type
      #   Object type. Always `user_profile`.
      #
      #   @return [Symbol, :user_profile]
      required :type, const: :user_profile

      # @!attribute updated_at
      #   When this user profile was last modified, in RFC 3339 format. It normally also
      #   updates shortly after Anthropic gives the profile an approval or withdraws one.
      #   Other changes to the statuses that Anthropic reports do not always update it, so
      #   read the status itself rather than watching this timestamp.
      #
      #   @return [Time]
      required :updated_at, Time

      # @!method initialize(id:, access_type:, created_at:, enforcement_actions:, enforcement_status:, external_user_details:, metadata:, name:, programs:, updated_at:, type: :user_profile)
      #   A record of an entity that the platform serves through the API, such as an
      #   end-user of the platform's product or a company that the platform resells Claude
      #   access to.
      #
      #   A Messages, Message Batches or token counting request can send a profile's `id`
      #   in the `anthropic-user-profile-id` header to attribute the request to that
      #   entity.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfile} for more details.
      #
      #   @param id [String] Unique identifier for this user profile, prefixed `uprof_`.
      #
      #   @param access_type [Symbol, Anthropic::Models::UserProfileAccessType] How the platform uses the API for this entity: `application` (default) or `passt
      #
      #   @param created_at [Time] When this user profile was created, in RFC 3339 format.
      #
      #   @param enforcement_actions [Array<Anthropic::Models::UserProfileEnforcementActionRestriction, Anthropic::Models::UserProfileEnforcementActionBan>] The enforcement actions open on this profile; empty when none is open. Absent un
      #
      #   @param enforcement_status [Symbol, Anthropic::Models::UserProfileEnforcementStatus] Anthropic's enforcement status of this profile, from its open enforcement action
      #
      #   @param external_user_details [Anthropic::Models::UserProfileExternalUserDetails] Details about the entity this profile represents, as the platform states them; n
      #
      #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up t
      #
      #   @param name [String, nil] Real-world name of the entity this profile represents (company or individual). F
      #
      #   @param programs [Anthropic::Models::UserProfilePrograms] The profile's standing in each Anthropic program, such as the Cyber Verification
      #
      #   @param updated_at [Time] When this user profile was last modified, in RFC 3339 format. It normally also u
      #
      #   @param type [Symbol, :user_profile] Object type. Always `user_profile`.
    end
  end
end

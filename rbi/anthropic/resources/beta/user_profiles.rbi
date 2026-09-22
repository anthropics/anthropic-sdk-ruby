# typed: strong

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        # Create User Profile
        sig do
          params(
            access_type:
              Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol,
            external_id: T.nilable(String),
            external_user_details:
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::OrHash,
            external_user_onboarded_at: Time,
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaUserProfile)
        end
        def create(
          # Body param: How the platform uses the API for this entity. `application`
          # (default): the profile represents an individual end-user of the platform's
          # product. `passthrough`: the profile identifies a company the platform resells
          # Claude access to.
          access_type: nil,
          # Body param: Platform's own identifier for this user. Not enforced unique.
          # Maximum 255 characters. Accepted under the `user-profiles-2026-03-24` and
          # `user-profiles-2026-08-18` beta headers; under `user-profiles-2026-09-04` send
          # `external_user_details.reference_id` instead.
          external_id: nil,
          # Body param: Details about the entity this profile represents, as the platform
          # states them. Every field is optional. Accepted under the
          # `user-profiles-2026-09-04` beta header only.
          external_user_details: nil,
          # Body param: When the entity this profile represents opened its account with the
          # platform, in RFC 3339 format: for an `application` profile, when the end-user
          # signed up; for a `passthrough` profile, when the company became the platform's
          # customer. Must be a complete timestamp no more than 1 minute in the future.
          # Optional. Accepted under the `user-profiles-2026-08-18` beta header; under
          # `user-profiles-2026-09-04` send `external_user_details.onboarded_at` instead.
          external_user_onboarded_at: nil,
          # Body param: Free-form key-value data to attach to this user profile. Maximum 16
          # keys, with keys up to 64 characters and values up to 512 characters. Values must
          # be non-empty strings.
          metadata: nil,
          # Body param: Optional for all profiles. Real-world name of the entity this
          # profile represents (company or individual); for a company the platform resells
          # Claude access to (`access_type` `passthrough`), that company's name where known.
          # Maximum 255 characters.
          name: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Get User Profile
        sig do
          params(
            user_profile_id: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaUserProfile)
        end
        def retrieve(
          # The ID of the user profile to get (`uprof_...`).
          user_profile_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Update User Profile
        sig do
          params(
            user_profile_id: String,
            access_type:
              T.nilable(
                Anthropic::Beta::UserProfileUpdateParams::AccessType::OrSymbol
              ),
            external_id: T.nilable(String),
            external_user_details:
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::OrHash,
            external_user_onboarded_at: Time,
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaUserProfile)
        end
        def update(
          # Path param: The ID of the user profile to update (`uprof_...`).
          user_profile_id,
          # Body param: If present, replaces the stored access type. Omit to leave
          # unchanged.
          access_type: nil,
          # Body param: If present, replaces the stored external_id. Omit to leave
          # unchanged. Maximum 255 characters. Accepted under the `user-profiles-2026-03-24`
          # and `user-profiles-2026-08-18` beta headers; under `user-profiles-2026-09-04`
          # send `external_user_details.reference_id` instead.
          external_id: nil,
          # Body param: Details about the entity this profile represents, as the platform
          # states them. Each field sent replaces the stored value; omit a field to leave it
          # unchanged. Once set, a value cannot be cleared and `null` is rejected. Accepted
          # under the `user-profiles-2026-09-04` beta header only.
          external_user_details: nil,
          # Body param: If present, replaces the stored account creation time. Omit to leave
          # unchanged; once set, the value cannot be cleared and `null` is rejected. Must be
          # a complete RFC 3339 timestamp no more than 1 minute in the future. Accepted
          # under the `user-profiles-2026-08-18` beta header; under
          # `user-profiles-2026-09-04` send `external_user_details.onboarded_at` instead.
          external_user_onboarded_at: nil,
          # Body param: Key-value pairs to merge into the stored metadata. Keys provided
          # overwrite existing values. To remove a key, set its value to an empty string.
          # Keys not provided are left unchanged. Maximum 16 keys, with keys up to 64
          # characters and values up to 512 characters.
          metadata: nil,
          # Body param: If present, replaces the stored name. Omit to leave unchanged.
          # Maximum 255 characters.
          name: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # List User Profiles
        sig do
          params(
            limit: Integer,
            order: Anthropic::Beta::UserProfileListParams::Order::OrSymbol,
            order_by: Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol,
            page: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[Anthropic::Beta::BetaUserProfile]
          )
        end
        def list(
          # Query param: The maximum number of user profiles to return, from 1 to 100.
          # Defaults to 20.
          limit: nil,
          # Query param: The sort direction, applied to the field that `order_by` selects.
          # Defaults to `desc`.
          order: nil,
          # Query param: The field to sort user profiles by, in the direction that `order`
          # sets. Defaults to `created_at`.
          order_by: nil,
          # Query param: The cursor for the page to return, taken from `next_page` in a
          # previous response.
          #
          # Leave it out to get the first page.
          page: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Create Enrollment URL
        sig do
          params(
            user_profile_id: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaUserProfileEnrollmentURL)
        end
        def create_enrollment_url(
          # The ID of the user profile to create an enrollment URL for (`uprof_...`).
          user_profile_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end

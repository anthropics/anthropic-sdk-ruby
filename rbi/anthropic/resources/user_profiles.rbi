# typed: strong

module Anthropic
  module Resources
    class UserProfiles
      sig { returns(Anthropic::Resources::UserProfiles::ActionURLs) }
      attr_reader :action_urls

      # Create User Profile
      sig do
        params(
          access_type: Anthropic::UserProfileAccessType::OrSymbol,
          external_user_details:
            Anthropic::UserProfileExternalUserDetailsParams::OrHash,
          metadata: T::Hash[Symbol, String],
          name: T.nilable(String),
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::UserProfile)
      end
      def create(
        # Body param: How the platform uses the API for this entity. `application`
        # (default): the profile represents an individual end-user of the platform's
        # product. `passthrough`: the profile identifies a company the platform resells
        # Claude access to.
        access_type: nil,
        # Body param: Details about the entity this profile represents, as the platform
        # states them. Every field is optional. Not accepted under the legacy
        # `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta headers, which
        # take the top-level `external_id` (and, under `user-profiles-2026-08-18`,
        # `external_user_onboarded_at`) instead.
        external_user_details: nil,
        # Body param: Free-form key-value data to attach to this user profile. Maximum 16
        # keys, with keys up to 64 characters and values up to 512 characters. Values must
        # be non-empty strings.
        metadata: nil,
        # Body param: Optional for all profiles. Real-world name of the entity this
        # profile represents (company or individual); for a company the platform resells
        # Claude access to (`access_type` `passthrough`), that company's name where known.
        # Maximum 255 characters.
        name: nil,
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
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::UserProfile)
      end
      def retrieve(
        # The ID of the user profile to get (`uprof_...`).
        user_profile_id,
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
          access_type: T.nilable(Anthropic::UserProfileAccessType::OrSymbol),
          external_user_details:
            Anthropic::UserProfileExternalUserDetailsParams::OrHash,
          metadata: T::Hash[Symbol, String],
          name: T.nilable(String),
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::UserProfile)
      end
      def update(
        # Path param: The ID of the user profile to update (`uprof_...`).
        user_profile_id,
        # Body param: If present, replaces the stored access type. Omit to leave
        # unchanged.
        access_type: nil,
        # Body param: Details about the entity this profile represents, as the platform
        # states them. Each field sent replaces the stored value; omit a field to leave it
        # unchanged. Once set, a value cannot be cleared and `null` is rejected. Not
        # accepted under the legacy `user-profiles-2026-03-24` and
        # `user-profiles-2026-08-18` beta headers.
        external_user_details: nil,
        # Body param: Key-value pairs to merge into the stored metadata. Keys provided
        # overwrite existing values. To remove a key, set its value to an empty string.
        # Keys not provided are left unchanged. Maximum 16 keys, with keys up to 64
        # characters and values up to 512 characters.
        metadata: nil,
        # Body param: If present, replaces the stored name. Omit to leave unchanged.
        # Maximum 255 characters.
        name: nil,
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
          enforcement_status:
            T::Array[Anthropic::UserProfileEnforcementStatus::OrSymbol],
          limit: Integer,
          order: Anthropic::UserProfileListOrder::OrSymbol,
          order_by: Anthropic::UserProfileListOrderBy::OrSymbol,
          page: String,
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::Internal::PageCursor[Anthropic::UserProfile])
      end
      def list(
        # Query param: Return only the user profiles whose `enforcement_status` is one of
        # these values: `unrestricted`, `pending`, `restricted` or `banned`. Repeat the
        # parameter to match any of several. With it set, a page may hold fewer than
        # `limit` profiles, or none, and still carry a `next_page`: the service examines a
        # bounded number of profiles per request, and only a null `next_page` means the
        # listing is complete. Rejected with `invalid_request_error` under the
        # `user-profiles-2026-09-04` and earlier beta headers. Fails with
        # `overloaded_error` when a profile's enforcement actions cannot be read for the
        # moment.
        enforcement_status: nil,
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

      # Delete User Profile
      sig do
        params(
          user_profile_id: String,
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(Anthropic::DeletedUserProfile)
      end
      def delete(
        # The ID of the user profile to delete (`uprof_...`).
        user_profile_id,
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

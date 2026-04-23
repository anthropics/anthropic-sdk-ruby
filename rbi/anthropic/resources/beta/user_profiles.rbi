# typed: strong

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        # Create User Profile
        sig do
          params(
            external_id: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaUserProfile)
        end
        def create(
          # Body param: Platform's own identifier for this user. Not enforced unique.
          # Maximum 255 characters.
          external_id: nil,
          # Body param: Free-form key-value data to attach to this user profile. Maximum 16
          # keys, with keys up to 64 characters and values up to 512 characters. Values must
          # be non-empty strings.
          metadata: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Get User Profile
        sig do
          params(
            user_profile_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaUserProfile)
        end
        def retrieve(
          # Path parameter user_profile_id
          user_profile_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Update User Profile
        sig do
          params(
            user_profile_id: String,
            external_id: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaUserProfile)
        end
        def update(
          # Path param: Path parameter user_profile_id
          user_profile_id,
          # Body param: If present, replaces the stored external_id. Omit to leave
          # unchanged. Maximum 255 characters.
          external_id: nil,
          # Body param: Key-value pairs to merge into the stored metadata. Keys provided
          # overwrite existing values. To remove a key, set its value to an empty string.
          # Keys not provided are left unchanged. Maximum 16 keys, with keys up to 64
          # characters and values up to 512 characters.
          metadata: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List User Profiles
        sig do
          params(
            limit: Integer,
            order: Anthropic::Beta::UserProfileListParams::Order::OrSymbol,
            page: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[Anthropic::Beta::BetaUserProfile]
          )
        end
        def list(
          # Query param: Query parameter for limit
          limit: nil,
          # Query param: Query parameter for order
          order: nil,
          # Query param: Query parameter for page
          page: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Create Enrollment URL
        sig do
          params(
            user_profile_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaUserProfileEnrollmentURL)
        end
        def create_enrollment_url(
          # Path parameter user_profile_id
          user_profile_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
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

# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::UserProfilesTest < Anthropic::Test::ResourceTest
  def test_create
    response = @anthropic.beta.user_profiles.create

    assert_pattern do
      response => Anthropic::Beta::BetaUserProfile
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        trust_grants: ^(Anthropic::Internal::Type::HashOf[Anthropic::Beta::BetaUserProfileTrustGrant]),
        type: Anthropic::Beta::BetaUserProfile::Type,
        updated_at: Time,
        external_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.user_profiles.retrieve("uprof_011CZkZCu8hGbp5mYRQgUmz9")

    assert_pattern do
      response => Anthropic::Beta::BetaUserProfile
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        trust_grants: ^(Anthropic::Internal::Type::HashOf[Anthropic::Beta::BetaUserProfileTrustGrant]),
        type: Anthropic::Beta::BetaUserProfile::Type,
        updated_at: Time,
        external_id: String | nil
      }
    end
  end

  def test_update
    response = @anthropic.beta.user_profiles.update("uprof_011CZkZCu8hGbp5mYRQgUmz9")

    assert_pattern do
      response => Anthropic::Beta::BetaUserProfile
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        trust_grants: ^(Anthropic::Internal::Type::HashOf[Anthropic::Beta::BetaUserProfileTrustGrant]),
        type: Anthropic::Beta::BetaUserProfile::Type,
        updated_at: Time,
        external_id: String | nil
      }
    end
  end

  def test_list
    response = @anthropic.beta.user_profiles.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaUserProfile
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        trust_grants: ^(Anthropic::Internal::Type::HashOf[Anthropic::Beta::BetaUserProfileTrustGrant]),
        type: Anthropic::Beta::BetaUserProfile::Type,
        updated_at: Time,
        external_id: String | nil
      }
    end
  end

  def test_create_enrollment_url
    response = @anthropic.beta.user_profiles.create_enrollment_url("uprof_011CZkZCu8hGbp5mYRQgUmz9")

    assert_pattern do
      response => Anthropic::Beta::BetaUserProfileEnrollmentURL
    end

    assert_pattern do
      response => {
        expires_at: Time,
        type: Anthropic::Beta::BetaUserProfileEnrollmentURL::Type,
        url: String
      }
    end
  end
end

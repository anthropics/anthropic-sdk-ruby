# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::UserProfilesTest < Anthropic::Test::ResourceTest
  def test_create
    response = @anthropic.user_profiles.create

    assert_pattern do
      response => Anthropic::UserProfile
    end

    assert_pattern do
      response => {
        id: String,
        access_type: Anthropic::UserProfileAccessType,
        created_at: Time,
        external_user_details: Anthropic::UserProfileExternalUserDetails,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String | nil,
        programs: Anthropic::UserProfilePrograms,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_retrieve
    response = @anthropic.user_profiles.retrieve("uprof_011CZkZCu8hGbp5mYRQgUmz9")

    assert_pattern do
      response => Anthropic::UserProfile
    end

    assert_pattern do
      response => {
        id: String,
        access_type: Anthropic::UserProfileAccessType,
        created_at: Time,
        external_user_details: Anthropic::UserProfileExternalUserDetails,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String | nil,
        programs: Anthropic::UserProfilePrograms,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_update
    response = @anthropic.user_profiles.update("uprof_011CZkZCu8hGbp5mYRQgUmz9")

    assert_pattern do
      response => Anthropic::UserProfile
    end

    assert_pattern do
      response => {
        id: String,
        access_type: Anthropic::UserProfileAccessType,
        created_at: Time,
        external_user_details: Anthropic::UserProfileExternalUserDetails,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String | nil,
        programs: Anthropic::UserProfilePrograms,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response = @anthropic.user_profiles.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::UserProfile
    end

    assert_pattern do
      row => {
        id: String,
        access_type: Anthropic::UserProfileAccessType,
        created_at: Time,
        external_user_details: Anthropic::UserProfileExternalUserDetails,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String | nil,
        programs: Anthropic::UserProfilePrograms,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_delete
    response = @anthropic.user_profiles.delete("uprof_011CZkZCu8hGbp5mYRQgUmz9")

    assert_pattern do
      response => Anthropic::DeletedUserProfile
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end

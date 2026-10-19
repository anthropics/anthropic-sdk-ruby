# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::UserProfiles::ActionURLsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.user_profiles.action_urls.create(
        "uprof_011CZkZCu8hGbp5mYRQgUmz9",
        action: {type: :enroll_end_user}
      )

    assert_pattern do
      response => Anthropic::Beta::UserProfiles::BetaUserProfileActionURL
    end

    assert_pattern do
      response => {
        expires_at: Time,
        type: Symbol,
        url: String
      }
    end
  end
end

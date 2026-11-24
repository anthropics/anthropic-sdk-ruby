# frozen_string_literal: true

require_relative "../../../../../test_helper"

class Anthropic::Test::Resources::Beta::UserProfiles::Providers::Google::DataControlsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.user_profiles.providers.google.data_controls.retrieve(
        "uprof_011CZkZCu8hGbp5mYRQgUmz9",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls
    end

    assert_pattern do
      response => {
        bucket_label_value: String,
        cmek: Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl,
        storage: Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl,
        type: Symbol,
        updated_at: Time,
        user_profile_id: String
      }
    end
  end

  def test_update
    response =
      @anthropic.beta.user_profiles.providers.google.data_controls.update(
        "uprof_011CZkZCu8hGbp5mYRQgUmz9",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls
    end

    assert_pattern do
      response => {
        bucket_label_value: String,
        cmek: Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl,
        storage: Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl,
        type: Symbol,
        updated_at: Time,
        user_profile_id: String
      }
    end
  end
end

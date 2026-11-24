# frozen_string_literal: true

require_relative "../../../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Providers::Google::Projects::DataControlsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response =
      @anthropic.beta.organization.providers.google.projects.data_controls.retrieve(
        "123456789012",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls
    end

    assert_pattern do
      response => {
        cmek: Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl,
        project_number: String,
        storage: Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_update
    response =
      @anthropic.beta.organization.providers.google.projects.data_controls.update(
        "123456789012",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls
    end

    assert_pattern do
      response => {
        cmek: Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl,
        project_number: String,
        storage: Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl,
        type: Symbol,
        updated_at: Time
      }
    end
  end
end

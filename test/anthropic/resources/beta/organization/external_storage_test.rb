# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ExternalStorageTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.organization.external_storage.create(
        provider_config: {
          account_id: "111122223333",
          bucket_name: "acme-safety-retention",
          region: "us-east-2",
          type: :aws
        },
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaExternalStorage
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String | nil,
        provider_config: Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig,
        setup_template_version: String | nil,
        status: Anthropic::Beta::Organization::BetaExternalStorage::Status,
        type: Symbol,
        updated_at: Time,
        user_profile_id: String | nil
      }
    end
  end

  def test_retrieve
    response =
      @anthropic.beta.organization.external_storage.retrieve(
        "external_storage_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaExternalStorage
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String | nil,
        provider_config: Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig,
        setup_template_version: String | nil,
        status: Anthropic::Beta::Organization::BetaExternalStorage::Status,
        type: Symbol,
        updated_at: Time,
        user_profile_id: String | nil
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.organization.external_storage.update(
        "external_storage_id",
        display_name: "x",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaExternalStorage
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String | nil,
        provider_config: Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig,
        setup_template_version: String | nil,
        status: Anthropic::Beta::Organization::BetaExternalStorage::Status,
        type: Symbol,
        updated_at: Time,
        user_profile_id: String | nil
      }
    end
  end

  def test_list
    response =
      @anthropic.beta.organization.external_storage.list(request_options: {extra_query: {beta: "true"}})

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaExternalStorage
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        display_name: String | nil,
        provider_config: Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig,
        setup_template_version: String | nil,
        status: Anthropic::Beta::Organization::BetaExternalStorage::Status,
        type: Symbol,
        updated_at: Time,
        user_profile_id: String | nil
      }
    end
  end

  def test_delete
    response =
      @anthropic.beta.organization.external_storage.delete(
        "external_storage_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaDeletedExternalStorage
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_activate
    response =
      @anthropic.beta.organization.external_storage.activate(
        "external_storage_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaExternalStorage
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String | nil,
        provider_config: Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig,
        setup_template_version: String | nil,
        status: Anthropic::Beta::Organization::BetaExternalStorage::Status,
        type: Symbol,
        updated_at: Time,
        user_profile_id: String | nil
      }
    end
  end
end

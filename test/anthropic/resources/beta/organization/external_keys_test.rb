# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::ExternalKeysTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.organization.external_keys.create(
        provider_config: {
          kms_arn: "arn:aws:kms:us-east-1:111122223333:key/abcd1234-5678-90ab-cdef-000011112222", type: :aws
        }
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaExternalKey
    end

    assert_pattern do
      response => {
        id: String,
        attachment: Anthropic::Beta::Organization::BetaExternalKey::Attachment,
        created_at: Time,
        display_name: String | nil,
        geo: String,
        provider_config: Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.organization.external_keys.retrieve("external_key_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaExternalKey
    end

    assert_pattern do
      response => {
        id: String,
        attachment: Anthropic::Beta::Organization::BetaExternalKey::Attachment,
        created_at: Time,
        display_name: String | nil,
        geo: String,
        provider_config: Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_update
    response = @anthropic.beta.organization.external_keys.update("external_key_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaExternalKey
    end

    assert_pattern do
      response => {
        id: String,
        attachment: Anthropic::Beta::Organization::BetaExternalKey::Attachment,
        created_at: Time,
        display_name: String | nil,
        geo: String,
        provider_config: Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.external_keys.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaExternalKey
    end

    assert_pattern do
      row => {
        id: String,
        attachment: Anthropic::Beta::Organization::BetaExternalKey::Attachment,
        created_at: Time,
        display_name: String | nil,
        geo: String,
        provider_config: Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_delete
    response = @anthropic.beta.organization.external_keys.delete("external_key_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::ExternalKeyDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_validate
    response = @anthropic.beta.organization.external_keys.validate("external_key_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse
    end

    assert_pattern do
      response => {
        error: String | nil,
        status: Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse::Status,
        type: Symbol
      }
    end
  end
end

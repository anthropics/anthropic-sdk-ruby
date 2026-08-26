# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::APIKeysTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.beta.organization.api_keys.retrieve("api_key_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaAPIKey
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::BetaAPIKeyCreatedBy | nil,
        expires_at: Time | nil,
        name: String,
        partial_key_hint: String | nil,
        principal: Anthropic::Beta::Organization::BetaAPIKey::Principal | nil,
        scope: Anthropic::Beta::Organization::BetaAPIKey::Scope,
        status: Anthropic::Beta::Organization::BetaAPIKey::Status,
        type: Symbol,
        workspace_id: String | nil
      }
    end
  end

  def test_update
    response = @anthropic.beta.organization.api_keys.update("api_key_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaAPIKey
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::BetaAPIKeyCreatedBy | nil,
        expires_at: Time | nil,
        name: String,
        partial_key_hint: String | nil,
        principal: Anthropic::Beta::Organization::BetaAPIKey::Principal | nil,
        scope: Anthropic::Beta::Organization::BetaAPIKey::Scope,
        status: Anthropic::Beta::Organization::BetaAPIKey::Status,
        type: Symbol,
        workspace_id: String | nil
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.api_keys.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAPIKey
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        created_by: Anthropic::Beta::Organization::BetaAPIKeyCreatedBy | nil,
        expires_at: Time | nil,
        name: String,
        partial_key_hint: String | nil,
        principal: Anthropic::Beta::Organization::BetaAPIKey::Principal | nil,
        scope: Anthropic::Beta::Organization::BetaAPIKey::Scope,
        status: Anthropic::Beta::Organization::BetaAPIKey::Status,
        type: Symbol,
        workspace_id: String | nil
      }
    end
  end
end

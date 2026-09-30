# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Organization::APIKeysTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.organization.api_keys.retrieve("api_key_id")

    assert_pattern do
      response => Anthropic::Organization::APIKey
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        created_by: Anthropic::Organization::APIKeyCreatedBy | nil,
        expires_at: Time | nil,
        name: String,
        partial_key_hint: String | nil,
        principal: Anthropic::Organization::APIKey::Principal | nil,
        scope: Anthropic::Organization::APIKey::Scope,
        status: Anthropic::Organization::APIKey::Status,
        type: Symbol
      }
    end
  end

  def test_update
    response = @anthropic.organization.api_keys.update("api_key_id")

    assert_pattern do
      response => Anthropic::Organization::APIKey
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        created_by: Anthropic::Organization::APIKeyCreatedBy | nil,
        expires_at: Time | nil,
        name: String,
        partial_key_hint: String | nil,
        principal: Anthropic::Organization::APIKey::Principal | nil,
        scope: Anthropic::Organization::APIKey::Scope,
        status: Anthropic::Organization::APIKey::Status,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.organization.api_keys.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::APIKey
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        created_by: Anthropic::Organization::APIKeyCreatedBy | nil,
        expires_at: Time | nil,
        name: String,
        partial_key_hint: String | nil,
        principal: Anthropic::Organization::APIKey::Principal | nil,
        scope: Anthropic::Organization::APIKey::Scope,
        status: Anthropic::Organization::APIKey::Status,
        type: Symbol
      }
    end
  end
end

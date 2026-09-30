# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Organization::ServiceAccountsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.organization.service_accounts.create(name: "ci-deploy-bot")

    assert_pattern do
      response => Anthropic::Organization::ServiceAccount
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        name: String,
        organization_role: Anthropic::Organization::ServiceAccount::OrganizationRole,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @anthropic.organization.service_accounts.retrieve("service_account_id")

    assert_pattern do
      response => Anthropic::Organization::ServiceAccount
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        name: String,
        organization_role: Anthropic::Organization::ServiceAccount::OrganizationRole,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end

  def test_update
    response = @anthropic.organization.service_accounts.update("service_account_id")

    assert_pattern do
      response => Anthropic::Organization::ServiceAccount
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        name: String,
        organization_role: Anthropic::Organization::ServiceAccount::OrganizationRole,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end

  def test_list
    response = @anthropic.organization.service_accounts.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::ServiceAccount
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        name: String,
        organization_role: Anthropic::Organization::ServiceAccount::OrganizationRole,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end

  def test_archive
    response = @anthropic.organization.service_accounts.archive("service_account_id")

    assert_pattern do
      response => Anthropic::Organization::ServiceAccount
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        name: String,
        organization_role: Anthropic::Organization::ServiceAccount::OrganizationRole,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end
end

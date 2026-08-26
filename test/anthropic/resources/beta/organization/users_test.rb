# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::UsersTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.beta.organization.users.retrieve("user_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaOrganizationUser
    end

    assert_pattern do
      response => {
        id: String,
        added_at: Time,
        email: String,
        name: String,
        role: Anthropic::Beta::BetaOrganizationRole,
        type: Symbol
      }
    end
  end

  def test_update_required_params
    response = @anthropic.beta.organization.users.update("user_id", role: :user)

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaOrganizationUser
    end

    assert_pattern do
      response => {
        id: String,
        added_at: Time,
        email: String,
        name: String,
        role: Anthropic::Beta::BetaOrganizationRole,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.users.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaOrganizationUser
    end

    assert_pattern do
      row => {
        id: String,
        added_at: Time,
        email: String,
        name: String,
        role: Anthropic::Beta::BetaOrganizationRole,
        type: Symbol
      }
    end
  end

  def test_remove
    response = @anthropic.beta.organization.users.remove("user_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::UserRemoveResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end

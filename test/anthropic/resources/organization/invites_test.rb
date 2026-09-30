# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Organization::InvitesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.organization.invites.create(email: "user@emaildomain.com", role: :user)

    assert_pattern do
      response => Anthropic::Organization::OrganizationInvite
    end

    assert_pattern do
      response => {
        id: String,
        accepted_at: Time | nil,
        email: String,
        expires_at: Time,
        invited_at: Time,
        rbac_group_ids: ^(Anthropic::Internal::Type::ArrayOf[String]),
        role: Anthropic::OrganizationRole,
        status: Anthropic::Organization::OrganizationInvite::Status,
        type: Symbol
      }
    end
  end

  def test_retrieve
    response = @anthropic.organization.invites.retrieve("invite_id")

    assert_pattern do
      response => Anthropic::Organization::OrganizationInvite
    end

    assert_pattern do
      response => {
        id: String,
        accepted_at: Time | nil,
        email: String,
        expires_at: Time,
        invited_at: Time,
        rbac_group_ids: ^(Anthropic::Internal::Type::ArrayOf[String]),
        role: Anthropic::OrganizationRole,
        status: Anthropic::Organization::OrganizationInvite::Status,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.organization.invites.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Organization::OrganizationInvite
    end

    assert_pattern do
      row => {
        id: String,
        accepted_at: Time | nil,
        email: String,
        expires_at: Time,
        invited_at: Time,
        rbac_group_ids: ^(Anthropic::Internal::Type::ArrayOf[String]),
        role: Anthropic::OrganizationRole,
        status: Anthropic::Organization::OrganizationInvite::Status,
        type: Symbol
      }
    end
  end

  def test_delete
    response = @anthropic.organization.invites.delete("invite_id")

    assert_pattern do
      response => Anthropic::Models::Organization::InviteDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end

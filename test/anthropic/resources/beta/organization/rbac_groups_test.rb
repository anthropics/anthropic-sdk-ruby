# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::RBACGroupsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.organization.rbac_groups.create(name: "Engineering")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaRBACGroup
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        role_ids: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        source_type: Anthropic::Beta::Organization::BetaRBACGroup::SourceType,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.organization.rbac_groups.retrieve("rbac_group_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaRBACGroup
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        role_ids: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        source_type: Anthropic::Beta::Organization::BetaRBACGroup::SourceType,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_update
    response = @anthropic.beta.organization.rbac_groups.update("rbac_group_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaRBACGroup
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        role_ids: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        source_type: Anthropic::Beta::Organization::BetaRBACGroup::SourceType,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.rbac_groups.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaRBACGroup
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        name: String,
        role_ids: ^(Anthropic::Internal::Type::ArrayOf[String]) | nil,
        source_type: Anthropic::Beta::Organization::BetaRBACGroup::SourceType,
        type: Symbol,
        updated_at: Time
      }
    end
  end

  def test_delete
    response = @anthropic.beta.organization.rbac_groups.delete("rbac_group_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Organization::RBACGroupDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end

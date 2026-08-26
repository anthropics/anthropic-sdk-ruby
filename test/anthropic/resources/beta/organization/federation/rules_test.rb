# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Federation::RulesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.organization.federation.rules.create(
        issuer_id: "issuer_id",
        match: {},
        name: "x",
        oauth_scope: "x",
        target: {service_account_id: "svac_01SDCCSbTxrXDpWc1phhtcfK", type: :service_account}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationRule
    end

    assert_pattern do
      response => {
        id: String,
        applies_to_all_workspaces: Anthropic::Internal::Type::Boolean,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        attributes: ^(Anthropic::Internal::Type::HashOf[String]) | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        issuer_id: String,
        issuer_name: String | nil,
        match: Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch,
        name: String,
        oauth_scope: String,
        target: Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget,
        token_lifetime_seconds: Integer,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil,
        workspace_id: String | nil,
        workspace_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.organization.federation.rules.retrieve("federation_rule_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationRule
    end

    assert_pattern do
      response => {
        id: String,
        applies_to_all_workspaces: Anthropic::Internal::Type::Boolean,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        attributes: ^(Anthropic::Internal::Type::HashOf[String]) | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        issuer_id: String,
        issuer_name: String | nil,
        match: Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch,
        name: String,
        oauth_scope: String,
        target: Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget,
        token_lifetime_seconds: Integer,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil,
        workspace_id: String | nil,
        workspace_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_update
    response = @anthropic.beta.organization.federation.rules.update("federation_rule_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationRule
    end

    assert_pattern do
      response => {
        id: String,
        applies_to_all_workspaces: Anthropic::Internal::Type::Boolean,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        attributes: ^(Anthropic::Internal::Type::HashOf[String]) | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        issuer_id: String,
        issuer_name: String | nil,
        match: Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch,
        name: String,
        oauth_scope: String,
        target: Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget,
        token_lifetime_seconds: Integer,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil,
        workspace_id: String | nil,
        workspace_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.federation.rules.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Federation::BetaFederationRule
    end

    assert_pattern do
      row => {
        id: String,
        applies_to_all_workspaces: Anthropic::Internal::Type::Boolean,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        attributes: ^(Anthropic::Internal::Type::HashOf[String]) | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        issuer_id: String,
        issuer_name: String | nil,
        match: Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch,
        name: String,
        oauth_scope: String,
        target: Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget,
        token_lifetime_seconds: Integer,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil,
        workspace_id: String | nil,
        workspace_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_archive
    response = @anthropic.beta.organization.federation.rules.archive("federation_rule_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationRule
    end

    assert_pattern do
      response => {
        id: String,
        applies_to_all_workspaces: Anthropic::Internal::Type::Boolean,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        attributes: ^(Anthropic::Internal::Type::HashOf[String]) | nil,
        created_at: Time,
        created_by_actor_id: String | nil,
        description: String | nil,
        issuer_id: String,
        issuer_name: String | nil,
        match: Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch,
        name: String,
        oauth_scope: String,
        target: Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget,
        token_lifetime_seconds: Integer,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil,
        workspace_id: String | nil,
        workspace_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end
end

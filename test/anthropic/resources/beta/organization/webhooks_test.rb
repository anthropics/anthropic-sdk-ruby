# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::WebhooksTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.organization.webhooks.create(
        enabled_events: [:"user_profile.enforcement_action_opened"],
        url: "x",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaNewOrganizationWebhookEndpoint
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        description: String,
        disabled_reason: String,
        enabled_events: ^(Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaNewOrganizationWebhookEndpoint::EnabledEvent]),
        name: String,
        signing_secret: String,
        state: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState,
        updated_at: Time,
        url: String
      }
    end
  end

  def test_retrieve
    response =
      @anthropic.beta.organization.webhooks.retrieve(
        "webhook_endpoint_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        description: String,
        disabled_reason: String,
        enabled_events: ^(Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent]),
        name: String,
        state: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState,
        updated_at: Time,
        url: String
      }
    end
  end

  def test_update
    response =
      @anthropic.beta.organization.webhooks.update(
        "webhook_endpoint_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        description: String,
        disabled_reason: String,
        enabled_events: ^(Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent]),
        name: String,
        state: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState,
        updated_at: Time,
        url: String
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.webhooks.list(request_options: {extra_query: {beta: "true"}})

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        description: String,
        disabled_reason: String,
        enabled_events: ^(Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint::EnabledEvent]),
        name: String,
        state: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState,
        updated_at: Time,
        url: String
      }
    end
  end

  def test_delete
    response =
      @anthropic.beta.organization.webhooks.delete(
        "webhook_endpoint_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaDeletedOrganizationWebhookEndpoint
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_regenerate_signing_secret
    response =
      @anthropic.beta.organization.webhooks.regenerate_signing_secret(
        "webhook_endpoint_id",
        request_options: {extra_query: {beta: "true"}}
      )

    assert_pattern do
      response => Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointSigningSecret
    end

    assert_pattern do
      response => {
        signing_secret: String
      }
    end
  end
end

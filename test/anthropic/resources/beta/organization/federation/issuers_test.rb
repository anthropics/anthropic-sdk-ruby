# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Federation::IssuersTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.organization.federation.issuers.create(issuer_url: "x", name: "x")

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationIssuer
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        check_jti: Anthropic::Internal::Type::Boolean,
        created_at: Time,
        created_by_actor_id: String | nil,
        issuer_url: String,
        jwks: Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS,
        jwks_polling_disabled_at: Time | nil,
        max_jwt_lifetime_seconds: Integer,
        name: String,
        poll_status: Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus | nil,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.organization.federation.issuers.retrieve("federation_issuer_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationIssuer
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        check_jti: Anthropic::Internal::Type::Boolean,
        created_at: Time,
        created_by_actor_id: String | nil,
        issuer_url: String,
        jwks: Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS,
        jwks_polling_disabled_at: Time | nil,
        max_jwt_lifetime_seconds: Integer,
        name: String,
        poll_status: Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus | nil,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end

  def test_update
    response = @anthropic.beta.organization.federation.issuers.update("federation_issuer_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationIssuer
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        check_jti: Anthropic::Internal::Type::Boolean,
        created_at: Time,
        created_by_actor_id: String | nil,
        issuer_url: String,
        jwks: Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS,
        jwks_polling_disabled_at: Time | nil,
        max_jwt_lifetime_seconds: Integer,
        name: String,
        poll_status: Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus | nil,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end

  def test_list
    response = @anthropic.beta.organization.federation.issuers.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Federation::BetaFederationIssuer
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        check_jti: Anthropic::Internal::Type::Boolean,
        created_at: Time,
        created_by_actor_id: String | nil,
        issuer_url: String,
        jwks: Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS,
        jwks_polling_disabled_at: Time | nil,
        max_jwt_lifetime_seconds: Integer,
        name: String,
        poll_status: Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus | nil,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end

  def test_archive
    response = @anthropic.beta.organization.federation.issuers.archive("federation_issuer_id")

    assert_pattern do
      response => Anthropic::Beta::Organization::Federation::BetaFederationIssuer
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        archived_by_actor_id: String | nil,
        check_jti: Anthropic::Internal::Type::Boolean,
        created_at: Time,
        created_by_actor_id: String | nil,
        issuer_url: String,
        jwks: Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS,
        jwks_polling_disabled_at: Time | nil,
        max_jwt_lifetime_seconds: Integer,
        name: String,
        poll_status: Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus | nil,
        type: Symbol,
        updated_at: Time,
        updated_by_actor_id: String | nil
      }
    end
  end
end

# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Vaults::CredentialsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.vaults.credentials.create(
        "vlt_011CZkZDLs7fYzm1hXNPeRjv",
        auth: {
          token: "bearer_exampletoken",
          mcp_server_url: "https://example-server.modelcontextprotocol.io/sse",
          type: :static_bearer
        }
      )

    assert_pattern do
      response => Anthropic::Beta::Vaults::BetaManagedAgentsCredential
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        auth: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type,
        updated_at: Time,
        vault_id: String,
        display_name: String | nil
      }
    end
  end

  def test_retrieve_required_params
    response =
      @anthropic.beta.vaults.credentials.retrieve(
        "vcrd_011CZkZEMt8gZan2iYOQfSkw",
        vault_id: "vlt_011CZkZDLs7fYzm1hXNPeRjv"
      )

    assert_pattern do
      response => Anthropic::Beta::Vaults::BetaManagedAgentsCredential
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        auth: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type,
        updated_at: Time,
        vault_id: String,
        display_name: String | nil
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.vaults.credentials.update(
        "vcrd_011CZkZEMt8gZan2iYOQfSkw",
        vault_id: "vlt_011CZkZDLs7fYzm1hXNPeRjv"
      )

    assert_pattern do
      response => Anthropic::Beta::Vaults::BetaManagedAgentsCredential
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        auth: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type,
        updated_at: Time,
        vault_id: String,
        display_name: String | nil
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.vaults.credentials.list("vlt_011CZkZDLs7fYzm1hXNPeRjv")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Vaults::BetaManagedAgentsCredential
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        auth: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type,
        updated_at: Time,
        vault_id: String,
        display_name: String | nil
      }
    end
  end

  def test_delete_required_params
    response =
      @anthropic.beta.vaults.credentials.delete(
        "vcrd_011CZkZEMt8gZan2iYOQfSkw",
        vault_id: "vlt_011CZkZDLs7fYzm1hXNPeRjv"
      )

    assert_pattern do
      response => Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential
    end

    assert_pattern do
      response => {
        id: String,
        type: Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type
      }
    end
  end

  def test_archive_required_params
    response =
      @anthropic.beta.vaults.credentials.archive(
        "vcrd_011CZkZEMt8gZan2iYOQfSkw",
        vault_id: "vlt_011CZkZDLs7fYzm1hXNPeRjv"
      )

    assert_pattern do
      response => Anthropic::Beta::Vaults::BetaManagedAgentsCredential
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        auth: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth,
        created_at: Time,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type,
        updated_at: Time,
        vault_id: String,
        display_name: String | nil
      }
    end
  end

  def test_mcp_oauth_validate_required_params
    skip("prism can't find endpoint with beta only tag")

    response =
      @anthropic.beta.vaults.credentials.mcp_oauth_validate(
        "vcrd_011CZkZEMt8gZan2iYOQfSkw",
        vault_id: "vlt_011CZkZDLs7fYzm1hXNPeRjv"
      )

    assert_pattern do
      response => Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation
    end

    assert_pattern do
      response => {
        credential_id: String,
        has_refresh_token: Anthropic::Internal::Type::Boolean,
        mcp_probe: Anthropic::Beta::Vaults::BetaManagedAgentsMCPProbe | nil,
        refresh: Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject | nil,
        status: Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus,
        type: Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type,
        validated_at: Time,
        vault_id: String
      }
    end
  end
end

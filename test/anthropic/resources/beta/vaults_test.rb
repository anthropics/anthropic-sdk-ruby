# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::VaultsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.vaults.create(display_name: "Example vault")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsVault
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::BetaManagedAgentsVault::Type,
        updated_at: Time
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.vaults.retrieve("vlt_011CZkZDLs7fYzm1hXNPeRjv")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsVault
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::BetaManagedAgentsVault::Type,
        updated_at: Time
      }
    end
  end

  def test_update
    response = @anthropic.beta.vaults.update("vlt_011CZkZDLs7fYzm1hXNPeRjv")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsVault
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::BetaManagedAgentsVault::Type,
        updated_at: Time
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.vaults.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaManagedAgentsVault
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::BetaManagedAgentsVault::Type,
        updated_at: Time
      }
    end
  end

  def test_delete
    response = @anthropic.beta.vaults.delete("vlt_011CZkZDLs7fYzm1hXNPeRjv")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeletedVault
    end

    assert_pattern do
      response => {
        id: String,
        type: Anthropic::Beta::BetaManagedAgentsDeletedVault::Type
      }
    end
  end

  def test_archive
    response = @anthropic.beta.vaults.archive("vlt_011CZkZDLs7fYzm1hXNPeRjv")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsVault
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        type: Anthropic::Beta::BetaManagedAgentsVault::Type,
        updated_at: Time
      }
    end
  end
end

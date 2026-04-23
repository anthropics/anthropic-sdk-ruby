# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::MemoryStores::MemoryVersionsTest < Anthropic::Test::ResourceTest
  def test_retrieve_required_params
    response =
      @anthropic.beta.memory_stores.memory_versions.retrieve(
        "memory_version_id",
        memory_store_id: "memory_store_id"
      )

    assert_pattern do
      response => Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        memory_id: String,
        memory_store_id: String,
        operation: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation,
        type: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type,
        content: String | nil,
        content_sha256: String | nil,
        content_size_bytes: Integer | nil,
        created_by: Anthropic::Beta::MemoryStores::BetaManagedAgentsActor | nil,
        path: String | nil,
        redacted_at: Time | nil,
        redacted_by: Anthropic::Beta::MemoryStores::BetaManagedAgentsActor | nil
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.memory_stores.memory_versions.list("memory_store_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        memory_id: String,
        memory_store_id: String,
        operation: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation,
        type: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type,
        content: String | nil,
        content_sha256: String | nil,
        content_size_bytes: Integer | nil,
        created_by: Anthropic::Beta::MemoryStores::BetaManagedAgentsActor | nil,
        path: String | nil,
        redacted_at: Time | nil,
        redacted_by: Anthropic::Beta::MemoryStores::BetaManagedAgentsActor | nil
      }
    end
  end

  def test_redact_required_params
    response =
      @anthropic.beta.memory_stores.memory_versions.redact(
        "memory_version_id",
        memory_store_id: "memory_store_id"
      )

    assert_pattern do
      response => Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        memory_id: String,
        memory_store_id: String,
        operation: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation,
        type: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type,
        content: String | nil,
        content_sha256: String | nil,
        content_size_bytes: Integer | nil,
        created_by: Anthropic::Beta::MemoryStores::BetaManagedAgentsActor | nil,
        path: String | nil,
        redacted_at: Time | nil,
        redacted_by: Anthropic::Beta::MemoryStores::BetaManagedAgentsActor | nil
      }
    end
  end
end

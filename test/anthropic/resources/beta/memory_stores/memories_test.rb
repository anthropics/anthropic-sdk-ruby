# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::MemoryStores::MemoriesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.memory_stores.memories.create("memory_store_id", content: "content", path: "xx")

    assert_pattern do
      response => Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory
    end

    assert_pattern do
      response => {
        id: String,
        content_sha256: String,
        content_size_bytes: Integer,
        created_at: Time,
        memory_store_id: String,
        memory_version_id: String,
        path: String,
        type: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type,
        updated_at: Time,
        content: String | nil
      }
    end
  end

  def test_retrieve_required_params
    response =
      @anthropic.beta.memory_stores.memories.retrieve("memory_id", memory_store_id: "memory_store_id")

    assert_pattern do
      response => Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory
    end

    assert_pattern do
      response => {
        id: String,
        content_sha256: String,
        content_size_bytes: Integer,
        created_at: Time,
        memory_store_id: String,
        memory_version_id: String,
        path: String,
        type: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type,
        updated_at: Time,
        content: String | nil
      }
    end
  end

  def test_update_required_params
    response = @anthropic.beta.memory_stores.memories.update("memory_id", memory_store_id: "memory_store_id")

    assert_pattern do
      response => Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory
    end

    assert_pattern do
      response => {
        id: String,
        content_sha256: String,
        content_size_bytes: Integer,
        created_at: Time,
        memory_store_id: String,
        memory_version_id: String,
        path: String,
        type: Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type,
        updated_at: Time,
        content: String | nil
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.memory_stores.memories.list("memory_store_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem
    end

    assert_pattern do
      case row
      in Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory
      in Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix
      end
    end

    assert_pattern do
      case row
      in {
        type: :memory,
        id: String,
        content_sha256: String,
        content_size_bytes: Integer,
        created_at: Time,
        memory_store_id: String,
        memory_version_id: String,
        path: String,
        updated_at: Time,
        content: String | nil
      }
      in {type: :memory_prefix, path: String}
      end
    end
  end

  def test_delete_required_params
    response = @anthropic.beta.memory_stores.memories.delete("memory_id", memory_store_id: "memory_store_id")

    assert_pattern do
      response => Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory
    end

    assert_pattern do
      response => {
        id: String,
        type: Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type
      }
    end
  end
end

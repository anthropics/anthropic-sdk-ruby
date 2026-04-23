# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::MemoryStoresTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.memory_stores.create(name: "x")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsMemoryStore
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        type: Anthropic::Beta::BetaManagedAgentsMemoryStore::Type,
        updated_at: Time,
        archived_at: Time | nil,
        description: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.memory_stores.retrieve("memory_store_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsMemoryStore
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        type: Anthropic::Beta::BetaManagedAgentsMemoryStore::Type,
        updated_at: Time,
        archived_at: Time | nil,
        description: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_update
    response = @anthropic.beta.memory_stores.update("memory_store_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsMemoryStore
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        type: Anthropic::Beta::BetaManagedAgentsMemoryStore::Type,
        updated_at: Time,
        archived_at: Time | nil,
        description: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.memory_stores.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaManagedAgentsMemoryStore
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        name: String,
        type: Anthropic::Beta::BetaManagedAgentsMemoryStore::Type,
        updated_at: Time,
        archived_at: Time | nil,
        description: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]) | nil
      }
    end
  end

  def test_delete
    response = @anthropic.beta.memory_stores.delete("memory_store_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore
    end

    assert_pattern do
      response => {
        id: String,
        type: Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type
      }
    end
  end

  def test_archive
    response = @anthropic.beta.memory_stores.archive("memory_store_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsMemoryStore
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        name: String,
        type: Anthropic::Beta::BetaManagedAgentsMemoryStore::Type,
        updated_at: Time,
        archived_at: Time | nil,
        description: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]) | nil
      }
    end
  end
end

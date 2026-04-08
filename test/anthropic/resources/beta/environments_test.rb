# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::EnvironmentsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.environments.create(name: "python-data-analysis")

    assert_pattern do
      response => Anthropic::Beta::BetaEnvironment
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: String | nil,
        config: Anthropic::Beta::BetaCloudConfig,
        created_at: String,
        description: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        type: Symbol,
        updated_at: String
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.environments.retrieve("env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::BetaEnvironment
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: String | nil,
        config: Anthropic::Beta::BetaCloudConfig,
        created_at: String,
        description: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        type: Symbol,
        updated_at: String
      }
    end
  end

  def test_update
    response = @anthropic.beta.environments.update("env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::BetaEnvironment
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: String | nil,
        config: Anthropic::Beta::BetaCloudConfig,
        created_at: String,
        description: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        type: Symbol,
        updated_at: String
      }
    end
  end

  def test_list
    response = @anthropic.beta.environments.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaEnvironment
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: String | nil,
        config: Anthropic::Beta::BetaCloudConfig,
        created_at: String,
        description: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        type: Symbol,
        updated_at: String
      }
    end
  end

  def test_delete
    response = @anthropic.beta.environments.delete("env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::BetaEnvironmentDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_archive
    response = @anthropic.beta.environments.archive("env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::BetaEnvironment
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: String | nil,
        config: Anthropic::Beta::BetaCloudConfig,
        created_at: String,
        description: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        type: Symbol,
        updated_at: String
      }
    end
  end
end

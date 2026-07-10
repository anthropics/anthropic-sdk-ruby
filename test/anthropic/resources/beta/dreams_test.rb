# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::DreamsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.dreams.create(inputs: [{memory_store_id: "x", type: :memory_store}], model: "string")

    assert_pattern do
      response => Anthropic::Beta::BetaDream
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        error: Anthropic::Beta::BetaDreamError | nil,
        inputs: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput]),
        instructions: String | nil,
        model: Anthropic::Beta::BetaDreamModelConfig,
        outputs: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaDreamOutput]),
        session_id: String | nil,
        status: Anthropic::Beta::BetaDreamStatus,
        type: Anthropic::Beta::BetaDream::Type,
        usage: Anthropic::Beta::BetaDreamUsage
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.dreams.retrieve("dream_id")

    assert_pattern do
      response => Anthropic::Beta::BetaDream
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        error: Anthropic::Beta::BetaDreamError | nil,
        inputs: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput]),
        instructions: String | nil,
        model: Anthropic::Beta::BetaDreamModelConfig,
        outputs: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaDreamOutput]),
        session_id: String | nil,
        status: Anthropic::Beta::BetaDreamStatus,
        type: Anthropic::Beta::BetaDream::Type,
        usage: Anthropic::Beta::BetaDreamUsage
      }
    end
  end

  def test_list
    response = @anthropic.beta.dreams.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaDream
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        error: Anthropic::Beta::BetaDreamError | nil,
        inputs: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput]),
        instructions: String | nil,
        model: Anthropic::Beta::BetaDreamModelConfig,
        outputs: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaDreamOutput]),
        session_id: String | nil,
        status: Anthropic::Beta::BetaDreamStatus,
        type: Anthropic::Beta::BetaDream::Type,
        usage: Anthropic::Beta::BetaDreamUsage
      }
    end
  end

  def test_archive
    response = @anthropic.beta.dreams.archive("dream_id")

    assert_pattern do
      response => Anthropic::Beta::BetaDream
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        error: Anthropic::Beta::BetaDreamError | nil,
        inputs: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput]),
        instructions: String | nil,
        model: Anthropic::Beta::BetaDreamModelConfig,
        outputs: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaDreamOutput]),
        session_id: String | nil,
        status: Anthropic::Beta::BetaDreamStatus,
        type: Anthropic::Beta::BetaDream::Type,
        usage: Anthropic::Beta::BetaDreamUsage
      }
    end
  end

  def test_cancel
    response = @anthropic.beta.dreams.cancel("dream_id")

    assert_pattern do
      response => Anthropic::Beta::BetaDream
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        error: Anthropic::Beta::BetaDreamError | nil,
        inputs: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput]),
        instructions: String | nil,
        model: Anthropic::Beta::BetaDreamModelConfig,
        outputs: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaDreamOutput]),
        session_id: String | nil,
        status: Anthropic::Beta::BetaDreamStatus,
        type: Anthropic::Beta::BetaDream::Type,
        usage: Anthropic::Beta::BetaDreamUsage
      }
    end
  end
end

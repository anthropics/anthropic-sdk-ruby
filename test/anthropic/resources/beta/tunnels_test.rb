# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::TunnelsTest < Anthropic::Test::ResourceTest
  def test_create
    response = @anthropic.beta.tunnels.create

    assert_pattern do
      response => Anthropic::Beta::BetaTunnel
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String | nil,
        domain: String,
        type: Symbol
      }
    end
  end

  def test_retrieve
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.tunnels.retrieve("tunnel_id")

    assert_pattern do
      response => Anthropic::Beta::BetaTunnel
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String | nil,
        domain: String,
        type: Symbol
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.tunnels.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaTunnel
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String | nil,
        domain: String,
        type: Symbol
      }
    end
  end

  def test_archive
    response = @anthropic.beta.tunnels.archive("tunnel_id")

    assert_pattern do
      response => Anthropic::Beta::BetaTunnel
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        display_name: String | nil,
        domain: String,
        type: Symbol
      }
    end
  end

  def test_reveal_token
    response = @anthropic.beta.tunnels.reveal_token("tunnel_id")

    assert_pattern do
      response => Anthropic::Beta::BetaTunnelToken
    end

    assert_pattern do
      response => {
        id: String,
        tunnel_token: String,
        type: Symbol
      }
    end
  end

  def test_rotate_token
    response = @anthropic.beta.tunnels.rotate_token("tunnel_id")

    assert_pattern do
      response => Anthropic::Beta::BetaTunnelToken
    end

    assert_pattern do
      response => {
        id: String,
        tunnel_token: String,
        type: Symbol
      }
    end
  end
end

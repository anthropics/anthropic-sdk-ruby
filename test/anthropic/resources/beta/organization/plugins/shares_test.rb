# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Plugins::SharesTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.plugins.shares.list("plugin_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::Plugins::BetaPluginShare
    end

    assert_pattern do
      row => {
        granted_at: Time,
        plugin_id: String,
        target: Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target,
        type: Symbol
      }
    end
  end
end

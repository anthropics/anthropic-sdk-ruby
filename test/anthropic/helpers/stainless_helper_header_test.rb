# frozen_string_literal: true

require_relative "../test_helper"

class AnthropicStainlessHelperHeaderTest < Minitest::Test
  def test_appends_to_empty
    assert_equal(
      "BetaToolRunner",
      Anthropic::Helpers::StainlessHelperHeader.merged_value({}, "BetaToolRunner")
    )
  end

  def test_appends_to_existing
    assert_equal(
      "mcp_tool, BetaToolRunner",
      Anthropic::Helpers::StainlessHelperHeader.merged_value(
        {"x-stainless-helper" => "mcp_tool"},
        "BetaToolRunner"
      )
    )
  end

  def test_dedups
    assert_equal(
      "BetaToolRunner",
      Anthropic::Helpers::StainlessHelperHeader.merged_value(
        {"x-stainless-helper" => "BetaToolRunner"},
        "BetaToolRunner"
      )
    )
  end

  def test_collapses_casings_and_multi_values
    assert_equal(
      "a, b, c, BetaToolRunner",
      Anthropic::Helpers::StainlessHelperHeader.merged_value(
        {"X-Stainless-Helper" => "a", "x-stainless-helper" => "b, c"},
        "BetaToolRunner"
      )
    )
  end
end

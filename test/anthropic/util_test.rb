# frozen_string_literal: true

require_relative "test_helper"

class Anthropic::Test::UtilTest < Test::Unit::TestCase
  def test_left_map
    assert_equal(Anthropic::Util.deep_merge({a: 1}, nil), nil)
  end

  def test_right_map
    assert_equal(Anthropic::Util.deep_merge(nil, {a: 1}), {a: 1})
  end

  def test_disjoint_maps
    assert_equal(
      Anthropic::Util.deep_merge({b: 2}, {a: 1}), {a: 1, b: 2}
    )
  end

  def test_overlapping_maps
    assert_equal(
      Anthropic::Util.deep_merge({b: 2, c: 3}, {a: 1, c: 4}),
      {a: 1, b: 2, c: 4}
    )
  end

  def test_nested
    assert_equal(
      Anthropic::Util.deep_merge({b: {b2: 1}}, {b: {b2: 2}}),
      {b: {b2: 2}}
    )
  end

  def test_nested_left_map
    assert_equal(
      Anthropic::Util.deep_merge({b: {b2: 1}}, {b: 6}),
      {b: 6}
    )
  end

  def test_omission
    assert_equal(
      {b: {b2: 1, b3: {d: 5}}},
      Anthropic::Util.deep_merge(
        {b: {b2: 1, b3: {c: 4, d: 5}}},
        {b: {b2: 1, b3: {c: Anthropic::Util::OMIT, d: 5}}}
      )
    )
  end

  def test_concat
    assert_equal(
      {a: {b: [1, 2, 3, 4]}},
      Anthropic::Util.deep_merge(
        {a: {b: [1, 2]}},
        {a: {b: [3, 4]}},
        concat: true
      )
    )
  end

  def test_concat_false
    assert_equal(
      {a: {b: [3, 4]}},
      Anthropic::Util.deep_merge(
        {a: {b: [1, 2]}},
        {a: {b: [3, 4]}},
        concat: false
      )
    )
  end
end

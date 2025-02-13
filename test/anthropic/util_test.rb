# frozen_string_literal: true

require_relative "test_helper"

class Anthropic::Test::UtilTest < Minitest::Test
  def test_left_map
    assert_pattern do
      Anthropic::Util.deep_merge({a: 1}, nil) => nil
    end
  end

  def test_right_map
    assert_pattern do
      Anthropic::Util.deep_merge(nil, {a: 1}) => {a: 1}
    end
  end

  def test_disjoint_maps
    assert_pattern do
      Anthropic::Util.deep_merge({b: 2}, {a: 1}) => {a: 1, b: 2}
    end
  end

  def test_overlapping_maps
    assert_pattern do
      Anthropic::Util.deep_merge({b: 2, c: 3}, {a: 1, c: 4}) => {a: 1, b: 2, c: 4}
    end
  end

  def test_nested
    assert_pattern do
      Anthropic::Util.deep_merge({b: {b2: 1}}, {b: {b2: 2}}) => {b: {b2: 2}}
    end
  end

  def test_nested_left_map
    assert_pattern do
      Anthropic::Util.deep_merge({b: {b2: 1}}, {b: 6}) => {b: 6}
    end
  end

  def test_omission
    merged = Anthropic::Util.deep_merge(
      {b: {b2: 1, b3: {c: 4, d: 5}}},
      {b: {b2: 1, b3: {c: Anthropic::Util::OMIT, d: 5}}}
    )

    assert_pattern do
      merged => {b: {b2: 1, b3: {d: 5}}}
    end
  end

  def test_concat
    merged = Anthropic::Util.deep_merge(
      {a: {b: [1, 2]}},
      {a: {b: [3, 4]}},
      concat: true
    )

    assert_pattern do
      merged => {a: {b: [1, 2, 3, 4]}}
    end
  end

  def test_concat_false
    merged = Anthropic::Util.deep_merge(
      {a: {b: [1, 2]}},
      {a: {b: [3, 4]}},
      concat: false
    )

    assert_pattern do
      merged => {a: {b: [3, 4]}}
    end
  end

  def test_dig
    assert_pattern do
      Anthropic::Util.dig(1, nil) => 1
      Anthropic::Util.dig({a: 1}, :b) => nil
      Anthropic::Util.dig({a: 1}, :a) => 1
      Anthropic::Util.dig({a: {b: 1}}, [:a, :b]) => 1

      Anthropic::Util.dig([], 1) => nil
      Anthropic::Util.dig([nil, [nil, 1]], [1, 1]) => 1
      Anthropic::Util.dig({a: [nil, 1]}, [:a, 1]) => 1
      Anthropic::Util.dig([], 1.0) => nil

      Anthropic::Util.dig(Object, 1) => nil
      Anthropic::Util.dig([], 1.0, 2) => 2
      Anthropic::Util.dig([], 1.0) { 2 } => 2
    end
  end

  def test_uri_parsing
    %w[
      http://example.com
      https://example.com/
      https://example.com:443/example?e1=e1&e2=e2&e=
    ].each do |url|
      parsed = Anthropic::Util.parse_uri(url)
      unparsed = Anthropic::Util.unparse_uri(parsed).to_s

      assert_equal(url, unparsed)
      assert_equal(parsed, Anthropic::Util.parse_uri(unparsed))
    end
  end

  def test_joining_uris
    cases = [
      [
        "h://a.b/c?d=e",
        "h://nope/ignored",
        Anthropic::Util.parse_uri("h://a.b/c?d=e")
      ],
      [
        "h://a.b/c?d=e",
        "h://nope",
        {
          host: "a.b",
          path: "/c",
          query: {"d" => ["e"]}
        }
      ]
    ]

    cases.each do |expect, lhs, rhs|
      assert_equal(
        URI.parse(expect),
        Anthropic::Util.join_parsed_uri(
          Anthropic::Util.parse_uri(lhs),
          rhs
        )
      )
    end
  end

  def test_joining_uri_queries
    base_url = "h://a.b/c?d=e"
    cases = {
      "c2" => "h://a.b/c/c2",
      "/c2?f=g" => "h://a.b/c2?f=g",
      "/c?f=g" => "h://a.b/c?d=e&f=g"
    }

    cases.each do |path, expected|
      assert_equal(
        URI.parse(expected),
        Anthropic::Util.join_parsed_uri(
          Anthropic::Util.parse_uri(base_url),
          {path: path}
        )
      )
    end
  end

  class FakeCGI < CGI
    def initialize(headers, io)
      @ctype = headers["content-type"]
      @io = io
      super()
    end

    def stdinput = @io

    def env_table
      {
        "REQUEST_METHOD" => "POST",
        "CONTENT_TYPE" => @ctype,
        "CONTENT_LENGTH" => stdinput.string.length
      }
    end
  end

  def test_multipart_file_encode
    headers = {"content-type" => "multipart/form-data"}
    File.open(__FILE__) do |fd|
      cases = {
        StringIO.new("abc") => "abc",
        fd => StringIO
      }
      cases.each do |body, val|
        encoded = Anthropic::Util.encode_content(headers, body)
        cgi = FakeCGI.new(*encoded)
        assert_pattern do
          cgi[""] => ^val
        end
      end
    end
  end

  def test_multipart_hash_encode
    headers = {"content-type" => "multipart/form-data"}
    cases = {
      {a: 2, b: 3} => {"a" => "2", "b" => "3"},
      {a: 2, b: nil} => {"a" => "2", "b" => "null"},
      {a: 2, b: [1, 2, 3]} => {"a" => "2", "b" => "1"},
      {file: StringIO.new("a")} => {"file" => "a"}
    }
    cases.each do |body, testcase|
      encoded = Anthropic::Util.encode_content(headers, body)
      cgi = FakeCGI.new(*encoded)
      testcase.each do |key, val|
        assert_equal(val, cgi[key])
      end
    end
  end
end

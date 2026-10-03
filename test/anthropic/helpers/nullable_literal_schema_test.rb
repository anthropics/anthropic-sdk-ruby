# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::NullableLiteralSchemaTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  class NullableLiterals < Anthropic::BaseModel
    required :status, const: :ok, nil?: true
    optional :code, const: :ready, nil?: true
  end

  class NonNullableLiterals < Anthropic::BaseModel
    required :status, const: :ok
  end

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
  end

  def teardown
    WebMock.reset!
    super
  end

  def test_nullable_public_literal_fields_keep_their_constants_and_presence
    schema = NullableLiterals.to_json_schema
    expected = {status: "ok", code: "ready"}
    expected.each do |name, literal|
      alternatives = schema.fetch(:properties).fetch(name).fetch(:anyOf)
      assert_equal(literal, alternatives.first.fetch(:const))
      assert_equal({type: "null"}, alternatives.last)
      assert_equal(2, alternatives.length)
    end
    assert_equal(["status"], schema.fetch(:required))
    assert_equal(false, schema.fetch(:additionalProperties))
    assert_equal(schema, NullableLiterals.to_json_schema)
  end

  def test_nullable_constant_transform_does_not_broaden_to_other_values
    converter = Anthropic::Helpers::InputSchema::JsonSchemaConverter
    ["ok", 7, 1.5, true, false, nil].each do |value|
      source = {const: value, description: "literal"}.freeze
      result = converter.to_nilable(source)
      assert_equal({anyOf: [source, {type: "null"}]}, result)
      assert_equal({const: value, description: "literal"}, source)
      assert_equal(result, converter.to_nilable(result))
    end
  end

  def test_non_nullable_constants_and_nullable_strings_keep_their_existing_shapes
    schema = NonNullableLiterals.to_json_schema
    assert_equal({const: "ok"}, schema.dig(:properties, :status))
    assert_equal({type: %w[string null]}, Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_nilable(type: "string"))
  end

  def test_ga_client_sends_nullable_literals_and_parses_null_values
    assert_client_roundtrip(beta: false, values: {status: nil, code: nil})
  end

  def test_beta_client_sends_nullable_literals_and_parses_exact_values
    assert_client_roundtrip(beta: true, values: {status: "ok", code: "ready"})
  end

  private def assert_client_roundtrip(beta:, values:)
    sent = nil
    stub_request(:post, %r{http://localhost/v1/messages(?:\?beta=true)?})
      .with do |request|
      sent = JSON.parse(request.body)
      true
    end
      .to_return(
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: JSON.generate(
          id: "msg_1",
          type: "message",
          role: "assistant",
          model: "claude-opus-4-6",
          content: [{type: "text", text: JSON.generate(values)}],
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 1, output_tokens: 1}
        )
      )
    client = Anthropic::Client.new(api_key: "test-key", base_url: "http://localhost")
    resource = beta ? client.beta.messages : client.messages
    response = resource.create(
      max_tokens: 64,
      model: "claude-opus-4-6",
      messages: [{role: :user, content: "test"}],
      output_config: {format: NullableLiterals}
    )
    schema = sent.fetch("output_config").fetch("format").fetch("schema")
    assert_equal({"type" => "null"}, schema.dig("properties", "status", "anyOf", 1))
    assert_equal("ok", schema.dig("properties", "status", "anyOf", 0, "const"))
    parsed = response.content.first.parsed
    assert_kind_of(NullableLiterals, parsed)
    values.each do |key, value|
      if value.nil?
        assert_nil(parsed.to_h.fetch(key))
      else
        assert_equal(value.to_sym, parsed.to_h.fetch(key))
      end
    end
  end
end

# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::InputSchemaReferenceTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  class Leaf < Anthropic::BaseModel
    required :value, String
  end

  class Nested < Anthropic::BaseModel
    required :first, Leaf
    required :second, Leaf
  end

  class Root < Anthropic::BaseModel
    required :container, Nested
  end

  class ArrayRoot < Anthropic::BaseModel
    required :items, Anthropic::ArrayOf[Nested]
  end

  class EscapedRoot < Anthropic::BaseModel
    required :"path/~1", Leaf
    required :other, Leaf
  end

  class Recursive < Anthropic::BaseModel
    required :value, String
    required :next, -> { Recursive }, nil?: true
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

  def assert_references_resolve(schema)
    document = JSON.parse(JSON.generate(schema))
    references = []
    walk = lambda do |value|
      case value
      in Hash
        references << value.fetch("$ref") if value.key?("$ref")
        value.each_value { walk.call(_1) }
      in Array
        value.each { walk.call(_1) }
      else
      end
    end
    walk.call(document)
    refute_empty(references)
    references.each do |reference|
      assert(reference.start_with?("#/"))
      tokens = reference.delete_prefix("#/").split("/", -1)
      # Evaluate RFC 6901 tokens independently of the schema converter.
      target = tokens.reduce(document) do |value, token|
        value.fetch(token.gsub("~1", "/").gsub("~0", "~"))
      end
      assert_kind_of(Hash, target)
      assert(target.key?("type") || target.key?("anyOf"))
    end
    document
  end

  def test_nested_reused_models_resolve_without_changing_definition_names
    schema = assert_references_resolve(Root.to_json_schema)
    assert_equal([".container/.first"], schema.fetch("$defs").keys)
    expected = "#/$defs/.container~1.first"
    assert_equal(expected, schema.dig("properties", "container", "properties", "first", "$ref"))
    assert_equal(expected, schema.dig("properties", "container", "properties", "second", "$ref"))
  end

  def test_arrays_of_reused_models_resolve_at_every_nesting_depth
    schema = assert_references_resolve(ArrayRoot.to_json_schema)
    definition = schema.fetch("$defs").fetch(".items/[]/.first")
    assert_equal({"value" => {"type" => "string"}}, definition.fetch("properties"))
    assert_equal(ArrayRoot.to_json_schema, ArrayRoot.to_json_schema)
  end

  def test_literal_slash_and_tilde_sequences_are_distinct_pointer_characters
    schema = assert_references_resolve(EscapedRoot.to_json_schema)
    assert_equal([".path/~1"], schema.fetch("$defs").keys)
    assert_equal("#/$defs/.path~1~01", schema.dig("properties", "other", "$ref"))
  end

  def test_recursive_root_definition_and_nullability_remain_resolvable
    schema = assert_references_resolve(Recursive.to_json_schema)
    assert_equal("#/$defs/", schema.fetch("$ref"))
    assert_equal({"type" => "null"}, schema.dig("$defs", "", "properties", "next", "anyOf", 1))
  end

  def test_ga_requests_send_resolvable_structured_output_schemas
    assert_wire_schema(false)
  end

  def test_beta_requests_send_resolvable_structured_output_schemas
    assert_wire_schema(true)
  end

  private def assert_wire_schema(beta)
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
          content: [
            {
              type: "text",
              text: JSON.generate(container: {first: {value: "a"}, second: {value: "b"}})
            }
          ],
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 1, output_tokens: 1}
        )
      )
    client = Anthropic::Client.new(api_key: "test-key", base_url: "http://localhost")
    resource = beta ? client.beta.messages : client.messages
    result = resource.create(
      max_tokens: 32,
      model: "claude-opus-4-6",
      messages: [{role: :user, content: "test"}],
      output_config: {format: Root}
    )
    assert_equal("msg_1", result.id)
    schema = assert_references_resolve(sent.fetch("output_config").fetch("format").fetch("schema"))
    assert_equal([".container/.first"], schema.fetch("$defs").keys)
    assert_kind_of(Root, result.content.first.parsed)
    assert_equal("a", result.content.first.parsed.container.first.value)
  end
end

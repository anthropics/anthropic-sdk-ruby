# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::InputSchemaSupportedKeywordsTest < Minitest::Test
  class ConstrainedEmail < Anthropic::BaseModel
    required :email, String, format: "email", max_length: 40, min_length: 5, doc: "Contact address"
  end

  class NullableEmail < Anthropic::BaseModel
    required :email, String, nil?: true, format: "email", max_length: 40
  end

  class ConstrainedItems < Anthropic::BaseModel
    required :items, Anthropic::ArrayOf[String, format: "uuid", min_length: 36], min_items: 1, max_items: 2
    required :empty_allowed, Anthropic::ArrayOf[Integer], min_items: 0, max_items: 4
  end

  class SupportedOnly < Anthropic::BaseModel
    required :date, String, format: "date", doc: "Calendar date"
    required :items, Anthropic::ArrayOf[String], min_items: 1
  end

  def test_supported_format_does_not_bypass_other_constraints
    schema = ConstrainedEmail.to_json_schema
    email = schema.fetch(:properties).fetch(:email)
    assert_equal("email", email[:format])
    refute(email.key?(:maxLength))
    refute(email.key?(:minLength))
    assert_includes(email[:description], "Contact address")
    assert_includes(email[:description], "maxLength=40")
    assert_includes(email[:description], "minLength=5")
    refute_includes(email[:description], "format=")
    assert_equal(schema, ConstrainedEmail.to_json_schema)
  end

  def test_nullable_supported_format_still_transforms_other_constraints
    email = NullableEmail.to_json_schema.fetch(:properties).fetch(:email)
    assert_equal(%w[string null], email[:type])
    assert_equal("email", email[:format])
    refute(email.key?(:maxLength))
    assert_includes(email[:description], "maxLength=40")
  end

  def test_supported_minimum_does_not_bypass_array_or_item_constraints
    properties = ConstrainedItems.to_json_schema.fetch(:properties)
    {items: [1, 2], empty_allowed: [0, 4]}.each do |name, (minimum, maximum)|
      array = properties.fetch(name)
      assert_equal(minimum, array[:minItems])
      refute(array.key?(:maxItems))
      assert_includes(array[:description], "maxItems=#{maximum}")
      refute_includes(array[:description], "minItems=")
    end
    item = properties.fetch(:items).fetch(:items)
    assert_equal("uuid", item[:format])
    refute(item.key?(:minLength))
    assert_includes(item[:description], "minLength=36")
  end

  def test_supported_only_schemas_keep_their_original_shape
    properties = SupportedOnly.to_json_schema.fetch(:properties)
    assert_equal({type: "string", format: "date", description: "Calendar date"}, properties[:date])
    assert_equal({type: "array", items: {type: "string"}, minItems: 1}, properties[:items])
  end
end

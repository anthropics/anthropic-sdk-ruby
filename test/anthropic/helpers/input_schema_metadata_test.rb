# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::InputSchemaMetadataTest < Minitest::Test
  class Details < Anthropic::BaseModel
    doc "Generic details"
    required :name, String
  end

  class SingleUse < Anthropic::BaseModel
    required :shipping, Details, doc: "Shipping destination"
  end

  class Reused < Anthropic::BaseModel
    required :shipping, Details, doc: "Shipping destination"
    required :billing, Details, doc: "Billing destination"
    required :first, Details
    required :second, Details
  end

  class OptionalDetails < Anthropic::BaseModel
    optional :shipping, Details, nil?: true, doc: "Optional destination"
  end

  class ItemDescriptions < Anthropic::BaseModel
    required :items, Anthropic::InputSchema::ArrayOf[Details, doc: "Item-specific details"]
  end

  class PlainDetails < Anthropic::BaseModel
    required :name, String
  end

  class PlainParent < Anthropic::BaseModel
    required :plain, PlainDetails, doc: "Plain field description"
  end

  def test_single_use_field_description_overrides_model_description
    schema = SingleUse.to_json_schema
    shipping = schema.fetch(:properties).fetch(:shipping)
    assert_equal("Shipping destination", shipping[:description])
    assert_equal("object", shipping[:type])
    assert_equal({name: {type: "string"}}, shipping[:properties])
    assert_equal(["name"], shipping[:required])
    assert_equal(false, shipping[:additionalProperties])
  end

  def test_reused_type_preserves_independent_field_and_definition_descriptions
    schema = Reused.to_json_schema
    properties = schema.fetch(:properties)
    assert_equal("Shipping destination", properties[:shipping][:description])
    assert_equal("Billing destination", properties[:billing][:description])
    definitions = schema.fetch(:$defs).values
    assert_equal(1, definitions.length)
    assert_equal("Generic details", definitions.first[:description])
    assert_equal(properties[:first], properties[:second])
    assert(properties[:first].key?(:$ref))
  end

  def test_nilable_inline_schema_preserves_contextual_description
    schema = OptionalDetails.to_json_schema
    alternatives = schema.fetch(:properties).fetch(:shipping).fetch(:anyOf)
    assert_equal("Optional destination", alternatives.first[:description])
    assert_equal({type: "null"}, alternatives.last)
    assert_equal([], schema[:required])
  end

  def test_array_item_description_overrides_the_item_type_description
    items = ItemDescriptions.to_json_schema.fetch(:properties).fetch(:items).fetch(:items)
    assert_equal("Item-specific details", items[:description])
    assert_equal("object", items[:type])
    assert_equal(["name"], items[:required])
  end

  def test_generation_does_not_change_model_metadata_or_other_schemas
    before = Details.to_json_schema
    first = SingleUse.to_json_schema
    Reused.to_json_schema
    assert_equal(first, SingleUse.to_json_schema)
    assert_equal(before, Details.to_json_schema)
    assert_equal("Generic details", Details.doc_string)
    assert_equal("Shipping destination", first[:properties][:shipping][:description])
  end

  def test_description_without_a_type_level_default_is_unchanged
    schema = PlainParent.to_json_schema
    assert_equal("Plain field description", schema[:properties][:plain][:description])
    assert_equal({name: {type: "string"}}, schema[:properties][:plain][:properties])
  end

  class PlainReuse < Anthropic::BaseModel
    required :described, PlainDetails, doc: "Only this field"
    required :undescribed, PlainDetails
  end

  def test_first_field_metadata_does_not_leak_into_later_uses
    properties = PlainReuse.to_json_schema.fetch(:properties)
    assert_equal("Only this field", properties[:described][:description])
    refute(properties[:undescribed].key?(:description))
    assert_equal(properties[:described].except(:description), properties[:undescribed])
  end
end

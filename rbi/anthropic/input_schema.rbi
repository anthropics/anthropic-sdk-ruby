# typed: strong
# frozen_string_literal: true

module Anthropic
  # Convenience aliases for input schema classes
  InputSchema = Anthropic::Helpers::InputSchema
  ArrayOf = Anthropic::Helpers::InputSchema::ArrayOf
  BaseModel = Anthropic::Helpers::InputSchema::BaseModel
  Boolean = Anthropic::Helpers::InputSchema::Boolean
  EnumOf = Anthropic::Helpers::InputSchema::EnumOf
  UnionOf = Anthropic::Helpers::InputSchema::UnionOf
end

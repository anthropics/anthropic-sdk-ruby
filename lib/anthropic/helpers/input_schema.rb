# frozen_string_literal: true

module Anthropic
  module Helpers
    # Helpers for the structured output API.
    #
    # see https://platform.Anthropic.com/docs/guides/structured-outputs
    # see https://json-schema.org
    #
    # Based on the DSL in {Anthropic::Internal::Type}, but currently only support the limited subset of JSON schema types used in structured output APIs.
    #
    # Supported types: {NilClass} {String} {Symbol} {Integer} {Float} {Anthropic::Boolean}, {Anthropic::EnumOf}, {Anthropic::UnionOf}, {Anthropic::ArrayOf}, {Anthropic::BaseModel}
    module InputSchema
    end
  end
end

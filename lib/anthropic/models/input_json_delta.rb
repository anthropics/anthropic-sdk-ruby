# frozen_string_literal: true

module Anthropic
  module Models
    class InputJSONDelta < Anthropic::Internal::Type::BaseModel
      # @!attribute partial_json
      #
      #   @return [String]
      required :partial_json, String

      # @!attribute type
      #
      #   @return [Symbol, :input_json_delta]
      required :type, const: :input_json_delta

      # @!method initialize(partial_json:, type: :input_json_delta)
      #   @param partial_json [String]
      #   @param type [Symbol, :input_json_delta]
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    class InputJSONDelta < BaseModel
      # @!attribute [rw] partial_json
      #   @return [String]
      required :partial_json, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::InputJSONDelta::Type]
      required :type, enum: -> { Anthropic::Models::InputJSONDelta::Type }

      class Type < Anthropic::Enum
        INPUT_JSON_DELTA = :input_json_delta
      end

      # Create a new instance of InputJSONDelta from a Hash of raw data.
      #
      # @overload initialize(partial_json: nil, type: nil)
      # @param partial_json [String]
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end

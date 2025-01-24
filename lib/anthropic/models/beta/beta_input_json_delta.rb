# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_input_json_delta => {
      #   partial_json: String,
      #   type: :input_json_delta
      # }
      # ```
      class BetaInputJSONDelta < Anthropic::BaseModel
        # @!attribute partial_json
        #
        #   @return [String]
        required :partial_json, String

        # @!attribute type
        #
        #   @return [Symbol, :input_json_delta]
        required :type, const: :input_json_delta

        # @!parse
        #   # @param partial_json [String]
        #   # @param type [String]
        #   #
        #   def initialize(partial_json:, type: :input_json_delta, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaInputJSONDelta = Beta::BetaInputJSONDelta
  end
end

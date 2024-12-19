# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaInputJSONDelta < Anthropic::BaseModel
        # @!attribute partial_json
        #
        #   @return [String]
        required :partial_json, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaInputJSONDelta::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaInputJSONDelta::Type }

        # @!parse
        #   # @param partial_json [String]
        #   # @param type [String]
        #   #
        #   def initialize(partial_json:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :input_json_delta
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          INPUT_JSON_DELTA = :input_json_delta
        end
      end
    end

    BetaInputJSONDelta = Beta::BetaInputJSONDelta
  end
end

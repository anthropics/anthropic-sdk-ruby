# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolResultBlockParam < Anthropic::BaseModel
        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolResultBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # @!attribute content
        #
        #   @return [Array<Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaTextBlockParam>, String]
        optional :content, Anthropic::Unknown

        # @!attribute is_error
        #
        #   @return [Boolean]
        optional :is_error, Anthropic::BooleanModel

        # @!parse
        #   # @param tool_use_id [String]
        #   # @param type [String]
        #   # @param cache_control [Object, nil]
        #   # @param content [Array<Object>, String, nil]
        #   # @param is_error [Boolean, nil]
        #   #
        #   def initialize(tool_use_id:, type:, cache_control: nil, content: nil, is_error: nil) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        class Type < Anthropic::Enum
          TOOL_RESULT = :tool_result
        end
      end
    end

    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam
  end
end

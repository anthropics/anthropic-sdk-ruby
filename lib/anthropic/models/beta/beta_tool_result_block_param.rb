# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolResultBlockParam < Anthropic::BaseModel
        # @!attribute [rw] tool_use_id
        #   @return [String]
        required :tool_use_id, String

        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolResultBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Type }

        # @!attribute [rw] cache_control
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # @!attribute [rw] content
        #   @return [Array<Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaTextBlockParam>, String]
        optional :content, Anthropic::Unknown

        # @!attribute [rw] is_error
        #   @return [Boolean]
        optional :is_error, Anthropic::BooleanModel

        class Type < Anthropic::Enum
          TOOL_RESULT = :tool_result
        end

        # @!parse
        #   # Create a new instance of BetaToolResultBlockParam from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :tool_use_id
        #   #   @option data [String] :type
        #   #   @option data [Object, nil] :cache_control
        #   #   @option data [Array<Object>, String, nil] :content
        #   #   @option data [Hash, nil] :is_error
        #   def initialize(data = {}) = super
      end
    end

    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam
  end
end

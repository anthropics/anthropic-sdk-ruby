# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolUseBlockParam < Anthropic::BaseModel
        # @!attribute id
        #   @return [String]
        required :id, String

        # @!attribute input
        #   @return [Object]
        required :input, Anthropic::Unknown

        # @!attribute name
        #   @return [String]
        required :name, String

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolUseBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolUseBlockParam::Type }

        # @!attribute cache_control
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        class Type < Anthropic::Enum
          TOOL_USE = :tool_use
        end

        # @!parse
        #   # Create a new instance of BetaToolUseBlockParam from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :id
        #   #   @option data [Object] :input
        #   #   @option data [String] :name
        #   #   @option data [String] :type
        #   #   @option data [Object, nil] :cache_control
        #   def initialize(data = {}) = super
      end
    end

    BetaToolUseBlockParam = Beta::BetaToolUseBlockParam
  end
end

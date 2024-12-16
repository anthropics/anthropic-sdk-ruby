# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolUseBlockParam < Anthropic::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #
        #   @return [Object]
        required :input, Anthropic::Unknown

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolUseBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolUseBlockParam::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # @!parse
        #   # @param id [String]
        #   # @param input [Object]
        #   # @param name [String]
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   #
        #   def initialize(id:, input:, name:, type:, cache_control: nil) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        class Type < Anthropic::Enum
          TOOL_USE = :tool_use
        end
      end
    end

    BetaToolUseBlockParam = Beta::BetaToolUseBlockParam
  end
end

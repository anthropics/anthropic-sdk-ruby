# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolUseBlockParam < BaseModel
      # @!attribute [rw] id
      #   @return [String]
      required :id, String

      # @!attribute [rw] input
      #   @return [Object]
      required :input, Anthropic::Unknown

      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolUseBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolUseBlockParam::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      class Type < Anthropic::Enum
        TOOL_USE = :tool_use
      end

      # Create a new instance of BetaToolUseBlockParam from a Hash of raw data.
      #
      # @overload initialize(id: nil, input: nil, name: nil, type: nil, cache_control: nil)
      # @param id [String]
      # @param input [Object]
      # @param name [String]
      # @param type [String]
      # @param cache_control [Object]
      def initialize(data = {})
        super
      end
    end
  end
end

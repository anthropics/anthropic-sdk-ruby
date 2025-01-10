# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # tool_use_block_param => {
    #   id: String,
    #   input: Anthropic::Unknown,
    #   name: String,
    #   type: enum: Anthropic::Models::ToolUseBlockParam::Type,
    #   cache_control: Anthropic::Models::CacheControlEphemeral
    # }
    # ```
    class ToolUseBlockParam < Anthropic::BaseModel
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
      #   @return [Symbol, Anthropic::Models::ToolUseBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::ToolUseBlockParam::Type }

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }

      # @!parse
      #   # @param id [String]
      #   # @param input [Object]
      #   # @param name [String]
      #   # @param type [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   #
      #   def initialize(id:, input:, name:, type:, cache_control: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case type
      # in :tool_use
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        TOOL_USE = :tool_use

        finalize!
      end
    end
  end
end

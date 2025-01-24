# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # tool_use_block_param => {
    #   id: String,
    #   input: Anthropic::Unknown,
    #   name: String,
    #   type: :tool_use,
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
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param input [Object]
      #   # @param name [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param type [String]
      #   #
      #   def initialize(id:, input:, name:, cache_control: nil, type: :tool_use, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end

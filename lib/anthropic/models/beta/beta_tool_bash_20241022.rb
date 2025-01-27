# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_bash20241022 => {
      #   name: :bash,
      #   type: :bash_20241022,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral
      # }
      # ```
      class BetaToolBash20241022 < Anthropic::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #     This is how the tool will be called by the model and in tool_use blocks.
        #
        #   @return [Symbol, :bash]
        required :name, const: :bash

        # @!attribute type
        #
        #   @return [Symbol, :bash_20241022]
        required :type, const: :bash_20241022

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!parse
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param name [Symbol, :bash]
        #   # @param type [Symbol, :bash_20241022]
        #   #
        #   def initialize(cache_control: nil, name: :bash, type: :bash_20241022, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaToolBash20241022 = Beta::BetaToolBash20241022
  end
end

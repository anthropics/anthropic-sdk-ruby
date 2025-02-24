# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolBash20250124 < Anthropic::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #     This is how the tool will be called by the model and in tool_use blocks.
        #
        #   @return [Symbol, :bash]
        required :name, const: :bash

        # @!attribute type
        #
        #   @return [Symbol, :bash_20250124]
        required :type, const: :bash_20250124

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!parse
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param name [Symbol, :bash]
        #   # @param type [Symbol, :bash_20250124]
        #   #
        #   def initialize(cache_control: nil, name: :bash, type: :bash_20250124, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaToolBash20250124 = Beta::BetaToolBash20250124
  end
end

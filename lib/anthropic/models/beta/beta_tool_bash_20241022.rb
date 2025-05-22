# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolBash20241022 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :bash]
        required :name, const: :bash

        # @!attribute type
        #
        #   @return [Symbol, :bash_20241022]
        required :type, const: :bash_20241022

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(cache_control: nil, name: :bash, type: :bash_20241022)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaToolBash20241022} for more details.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param name [Symbol, :bash] Name of the tool.
        #
        #   @param type [Symbol, :bash_20241022]
      end
    end

    BetaToolBash20241022 = Beta::BetaToolBash20241022
  end
end

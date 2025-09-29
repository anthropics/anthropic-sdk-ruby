# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMemoryTool20250818 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :memory]
        required :name, const: :memory

        # @!attribute type
        #
        #   @return [Symbol, :memory_20250818]
        required :type, const: :memory_20250818

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(cache_control: nil, name: :memory, type: :memory_20250818)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaMemoryTool20250818} for more details.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param name [Symbol, :memory] Name of the tool.
        #
        #   @param type [Symbol, :memory_20250818]
      end
    end

    BetaMemoryTool20250818 = Beta::BetaMemoryTool20250818
  end
end

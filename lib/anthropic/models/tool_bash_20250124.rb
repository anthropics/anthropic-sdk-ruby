# frozen_string_literal: true

module Anthropic
  module Models
    class ToolBash20250124 < Anthropic::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the tool.
      #
      #   This is how the tool will be called by the model and in tool_use blocks.
      #
      #   @return [Symbol, :bash]
      required :name, const: :bash

      # @!attribute type
      #
      #   @return [Symbol, :bash_20250124]
      required :type, const: :bash_20250124

      # @!attribute cache_control
      #
      #   @return [Anthropic::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(cache_control: nil, name: :bash, type: :bash_20250124)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::ToolBash20250124} for more details.
      #
      #   @param cache_control [Anthropic::CacheControlEphemeral, nil]
      #
      #   @param name [Symbol, :bash] Name of the tool.
      #
      #   @param type [Symbol, :bash_20250124]
    end
  end
end

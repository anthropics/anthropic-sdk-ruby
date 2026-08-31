# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerToolset20260801 < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :computer_toolset_20260801]
      required :type, const: :computer_toolset_20260801

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute configs
      #   Per-member configuration for `computer_toolset_20260801`: one optional field per
      #   member tool, keyed by the member name — the same name the member's `tool_use`
      #   blocks carry. Every member is an accepted key, and a member's defaults apply
      #   wherever its key is absent. Unknown keys are rejected: the field set is this
      #   toolset version's complete member set.
      #
      #   @return [Anthropic::Models::ComputerToolsetConfigs, nil]
      optional :configs, -> { Anthropic::ComputerToolsetConfigs }, nil?: true

      # @!method initialize(cache_control: nil, configs: nil, type: :computer_toolset_20260801)
      #   The computer toolset: a single `tools[]` entry (carrying no `name`) that
      #   declares the computer tool family. The model is served the family's tool with
      #   any members disabled via `configs` removed from its schema. Every member is
      #   enabled by default, zoom included. The single-tool options `display_number` and
      #   `enable_zoom` are not fields of a toolset entry — it carries only `type`,
      #   `configs`, and `cache_control`; zoom is controlled via `configs.zoom.enabled`.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ComputerToolset20260801} for more details.
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param configs [Anthropic::Models::ComputerToolsetConfigs, nil] Per-member configuration for `computer_toolset_20260801`: one
      #
      #   @param type [Symbol, :computer_toolset_20260801]
    end
  end
end

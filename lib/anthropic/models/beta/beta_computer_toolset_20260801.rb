# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerToolset20260801 < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :computer_toolset_20260801]
        required :type, const: :computer_toolset_20260801

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute configs
        #   Sparse per-member overrides, keyed by member name. Absent, null, and {} are
        #   equivalent; a member's defaults apply wherever its key is absent.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerToolsetConfigs, nil]
        optional :configs, -> { Anthropic::Beta::BetaComputerToolsetConfigs }, nil?: true

        # @!method initialize(cache_control: nil, configs: nil, type: :computer_toolset_20260801)
        #   The computer toolset: a single `tools[]` entry (carrying no `name`) that
        #   declares the computer tool family. The model is served the family's tool with
        #   any members disabled via `configs` removed from its schema. Every member is
        #   enabled by default, zoom included. The single-tool options `display_number` and
        #   `enable_zoom` are not fields of a toolset entry — it carries only `type`,
        #   `configs`, and `cache_control`; zoom is controlled via `configs.zoom.enabled`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerToolset20260801} for more details.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param configs [Anthropic::Models::Beta::BetaComputerToolsetConfigs, nil] Sparse per-member overrides, keyed by member name. Absent, null, and {} are equi
        #
        #   @param type [Symbol, :computer_toolset_20260801]
      end
    end

    BetaComputerToolset20260801 = Beta::BetaComputerToolset20260801
  end
end

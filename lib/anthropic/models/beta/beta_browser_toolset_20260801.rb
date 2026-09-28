# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserToolset20260801 < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :browser_toolset_20260801]
        required :type, const: :browser_toolset_20260801

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute configs
        #   Sparse per-member overrides, keyed by member name. Absent, null, and {} are
        #   equivalent; a member's defaults apply wherever its key is absent.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserToolsetConfigs, nil]
        optional :configs, -> { Anthropic::Beta::BetaBrowserToolsetConfigs }, nil?: true

        # @!method initialize(cache_control: nil, configs: nil, type: :browser_toolset_20260801)
        #   The browser toolset: a single `tools[]` entry (carrying no `name`) that declares
        #   the browser tool family. The model is served the family's tool with any members
        #   disabled via `configs` removed from its schema.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserToolset20260801} for more details.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param configs [Anthropic::Models::Beta::BetaBrowserToolsetConfigs, nil] Sparse per-member overrides, keyed by member name. Absent, null, and {} are equi
        #
        #   @param type [Symbol, :browser_toolset_20260801]
      end
    end

    BetaBrowserToolset20260801 = Beta::BetaBrowserToolset20260801
  end
end

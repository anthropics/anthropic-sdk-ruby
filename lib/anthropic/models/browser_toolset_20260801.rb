# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserToolset20260801 < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :browser_toolset_20260801]
      required :type, const: :browser_toolset_20260801

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute configs
      #   Per-member configuration for `browser_toolset_20260801`: one optional field per
      #   member tool, keyed by the member name — the same name the member's `tool_use`
      #   blocks carry. Every member is an accepted key, and a member's defaults apply
      #   wherever its key is absent. Unknown keys are rejected: the field set is this
      #   toolset version's complete member set.
      #
      #   @return [Anthropic::Models::BrowserToolsetConfigs, nil]
      optional :configs, -> { Anthropic::BrowserToolsetConfigs }, nil?: true

      # @!method initialize(cache_control: nil, configs: nil, type: :browser_toolset_20260801)
      #   The browser toolset: a single `tools[]` entry (carrying no `name`) that declares
      #   the browser tool family. The model is served the family's tool with any members
      #   disabled via `configs` removed from its schema.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserToolset20260801} for more details.
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param configs [Anthropic::Models::BrowserToolsetConfigs, nil] Per-member configuration for `browser_toolset_20260801`: one
      #
      #   @param type [Symbol, :browser_toolset_20260801]
    end
  end
end

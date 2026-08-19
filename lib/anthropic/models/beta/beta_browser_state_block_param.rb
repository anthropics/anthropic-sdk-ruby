# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserStateBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute tabs
        #   All tabs open in the browser after this call — the full inventory, not a delta.
        #   May be empty. Whenever non-empty, exactly one entry carries `active: true`.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaBrowserStateTabEntry>]
        required :tabs, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaBrowserStateTabEntry] }

        # @!attribute type
        #
        #   @return [Symbol, :browser_state]
        required :type, const: :browser_state

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute state_changes
        #   Tabs opened and download state changes during this call. "Nothing to report" is
        #   expressed by omitting the field, never by an empty list.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaBrowserStateChangeTabOpened, Anthropic::Models::Beta::BetaBrowserStateChangeDownloadStarted, Anthropic::Models::Beta::BetaBrowserStateChangeDownloadCompleted, Anthropic::Models::Beta::BetaBrowserStateChangeDownloadFailed>, nil]
        optional :state_changes,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaBrowserStateChange] },
                 nil?: true

        # @!method initialize(tabs:, cache_control: nil, state_changes: nil, type: :browser_state)
        #   The caller's browser state after a browser toolset member call — the full
        #   inventory of open tabs, which tab is active, and any side effects (tabs opened,
        #   download state changes) the call produced.
        #
        #   At most one per `tool_result`, only on a non-error result answering a browser
        #   toolset member `tool_use`. The server renders the model-visible text from it;
        #   the model never sees the raw fields.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserStateBlockParam} for more details.
        #
        #   @param tabs [Array<Anthropic::Models::Beta::BetaBrowserStateTabEntry>] All tabs open in the browser after this call — the full inventory, not a delta.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param state_changes [Array<Anthropic::Models::Beta::BetaBrowserStateChangeTabOpened, Anthropic::Models::Beta::BetaBrowserStateChangeDownloadStarted, Anthropic::Models::Beta::BetaBrowserStateChangeDownloadCompleted, Anthropic::Models::Beta::BetaBrowserStateChangeDownloadFailed>, nil] Tabs opened and download state changes during this call. "Nothing to report" is
        #
        #   @param type [Symbol, :browser_state]
      end
    end

    BetaBrowserStateBlockParam = Beta::BetaBrowserStateBlockParam
  end
end

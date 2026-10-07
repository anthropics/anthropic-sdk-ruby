# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserSwitchTabToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Make the tab with the given tab_id the active tab — the tab that actions without
        #   a tab_id apply to.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserSwitchTabInput]
        required :input, -> { Anthropic::Beta::BetaBrowserSwitchTabInput }

        # @!attribute name
        #
        #   @return [Symbol, :switch_tab]
        required :name, const: :switch_tab

        # @!attribute toolset_name
        #
        #   @return [Symbol, :browser]
        required :toolset_name, const: :browser

        # @!attribute type
        #
        #   @return [Symbol, :tool_use]
        required :type, const: :tool_use

        # @!attribute caller_
        #   Which party invoked the tool call: the model directly, or a server tool on its
        #   behalf.
        #
        #   @return [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120, nil]
        optional :caller_, union: -> { Anthropic::Beta::BetaToolUseCaller }, api_name: :caller

        # @!method initialize(id:, input:, caller_: nil, name: :switch_tab, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserSwitchTabToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserSwitchTabInput] Make the tab with the given tab_id the active tab — the tab that actions without
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :switch_tab]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserSwitchTabToolUseBlock = Beta::BetaBrowserSwitchTabToolUseBlock
  end
end

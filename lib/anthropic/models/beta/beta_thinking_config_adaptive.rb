# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingConfigAdaptive < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :adaptive]
        required :type, const: :adaptive

        # @!attribute display_
        #   Controls how thinking content appears in the response. When set to `summarized`,
        #   thinking is returned normally. When set to `omitted`, thinking content is
        #   redacted but a signature is returned for multi-turn continuity. Defaults to
        #   `summarized`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaThinkingConfigAdaptive::Display, nil]
        optional :display_,
                 enum: -> { Anthropic::Beta::BetaThinkingConfigAdaptive::Display },
                 api_name: :display,
                 nil?: true

        # @!method initialize(display_: nil, type: :adaptive)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaThinkingConfigAdaptive} for more details.
        #
        #   @param display_ [Symbol, Anthropic::Models::Beta::BetaThinkingConfigAdaptive::Display, nil] Controls how thinking content appears in the response. When set to `summarized`,
        #
        #   @param type [Symbol, :adaptive]

        # Controls how thinking content appears in the response. When set to `summarized`,
        # thinking is returned normally. When set to `omitted`, thinking content is
        # redacted but a signature is returned for multi-turn continuity. Defaults to
        # `summarized`.
        #
        # @see Anthropic::Models::Beta::BetaThinkingConfigAdaptive#display_
        module Display
          extend Anthropic::Internal::Type::Enum

          SUMMARIZED = :summarized
          OMITTED = :omitted

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaThinkingConfigAdaptive = Beta::BetaThinkingConfigAdaptive
  end
end

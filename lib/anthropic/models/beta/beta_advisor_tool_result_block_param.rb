# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaAdvisorToolResultErrorParam, Anthropic::Models::Beta::BetaAdvisorResultBlockParam, Anthropic::Models::Beta::BetaAdvisorRedactedResultBlockParam]
        required :content, union: -> { Anthropic::Beta::BetaAdvisorToolResultBlockParam::Content }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :advisor_tool_result]
        required :type, const: :advisor_tool_result

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :advisor_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaAdvisorToolResultErrorParam, Anthropic::Models::Beta::BetaAdvisorResultBlockParam, Anthropic::Models::Beta::BetaAdvisorRedactedResultBlockParam]
        #
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :advisor_tool_result]

        # @see Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaAdvisorToolResultErrorParam }

          variant -> { Anthropic::Beta::BetaAdvisorResultBlockParam }

          variant -> { Anthropic::Beta::BetaAdvisorRedactedResultBlockParam }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaAdvisorToolResultErrorParam, Anthropic::Models::Beta::BetaAdvisorResultBlockParam, Anthropic::Models::Beta::BetaAdvisorRedactedResultBlockParam)]
        end
      end
    end

    BetaAdvisorToolResultBlockParam = Beta::BetaAdvisorToolResultBlockParam
  end
end

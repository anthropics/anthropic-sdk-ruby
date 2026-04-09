# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorToolResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaAdvisorToolResultError, Anthropic::Models::Beta::BetaAdvisorResultBlock, Anthropic::Models::Beta::BetaAdvisorRedactedResultBlock]
        required :content, union: -> { Anthropic::Beta::BetaAdvisorToolResultBlock::Content }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :advisor_tool_result]
        required :type, const: :advisor_tool_result

        # @!method initialize(content:, tool_use_id:, type: :advisor_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaAdvisorToolResultError, Anthropic::Models::Beta::BetaAdvisorResultBlock, Anthropic::Models::Beta::BetaAdvisorRedactedResultBlock]
        #   @param tool_use_id [String]
        #   @param type [Symbol, :advisor_tool_result]

        # @see Anthropic::Models::Beta::BetaAdvisorToolResultBlock#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaAdvisorToolResultError }

          variant -> { Anthropic::Beta::BetaAdvisorResultBlock }

          variant -> { Anthropic::Beta::BetaAdvisorRedactedResultBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaAdvisorToolResultError, Anthropic::Models::Beta::BetaAdvisorResultBlock, Anthropic::Models::Beta::BetaAdvisorRedactedResultBlock)]
        end
      end
    end

    BetaAdvisorToolResultBlock = Beta::BetaAdvisorToolResultBlock
  end
end

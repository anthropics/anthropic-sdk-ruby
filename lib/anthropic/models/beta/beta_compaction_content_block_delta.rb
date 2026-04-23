# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCompactionContentBlockDelta < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, nil]
        required :content, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :compaction_delta]
        required :type, const: :compaction_delta

        # @!method initialize(content:, type: :compaction_delta)
        #   @param content [String, nil]
        #   @param type [Symbol, :compaction_delta]
      end
    end

    BetaCompactionContentBlockDelta = Beta::BetaCompactionContentBlockDelta
  end
end

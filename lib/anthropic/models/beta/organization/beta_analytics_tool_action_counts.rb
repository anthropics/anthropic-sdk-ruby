# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsToolActionCounts < Anthropic::Internal::Type::BaseModel
          # @!attribute accepted_count
          #   Number of tool proposals accepted
          #
          #   @return [Integer]
          required :accepted_count, Integer

          # @!attribute rejected_count
          #   Number of tool proposals rejected
          #
          #   @return [Integer]
          required :rejected_count, Integer

          # @!method initialize(accepted_count:, rejected_count:)
          #   Accepted/rejected counts for a single Claude Code tool type.
          #
          #   @param accepted_count [Integer] Number of tool proposals accepted
          #
          #   @param rejected_count [Integer] Number of tool proposals rejected
        end
      end
    end
  end
end

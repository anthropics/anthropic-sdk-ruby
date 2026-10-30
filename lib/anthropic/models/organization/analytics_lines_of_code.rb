# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsLinesOfCode < Anthropic::Internal::Type::BaseModel
        # @!attribute added_count
        #   Lines of code added
        #
        #   @return [Integer]
        required :added_count, Integer

        # @!attribute removed_count
        #   Lines of code removed
        #
        #   @return [Integer]
        required :removed_count, Integer

        # @!method initialize(added_count:, removed_count:)
        #   Lines of code added and removed via Claude Code.
        #
        #   @param added_count [Integer] Lines of code added
        #
        #   @param removed_count [Integer] Lines of code removed
      end
    end
  end
end

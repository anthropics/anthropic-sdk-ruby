# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Workspaces
        # Rate limiter type.
        module WorkspaceRateLimitType
          extend Anthropic::Internal::Type::Enum

          FAST_ITPMCA = :fast_itpmca
          FAST_OTPM = :fast_otpm
          INPUT_TOKENS_PER_MINUTE = :input_tokens_per_minute
          INPUT_TOKENS_PER_MINUTE_CACHE_AWARE = :input_tokens_per_minute_cache_aware
          OUTPUT_TOKENS_PER_MINUTE = :output_tokens_per_minute
          REQUESTS_PER_MINUTE = :requests_per_minute
          TOKENS_PER_DAY = :tokens_per_day
          TOKENS_PER_MINUTE = :tokens_per_minute
          TOOL_USES_PER_SECOND = :tool_uses_per_second

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      WorkspaceRateLimitType = Workspaces::WorkspaceRateLimitType
    end
  end
end

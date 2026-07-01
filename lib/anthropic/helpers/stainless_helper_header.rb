# frozen_string_literal: true

module Anthropic
  module Helpers
    # Single source of truth for the `x-stainless-helper` telemetry header — the
    # key, the closed value vocabulary shared across SDKs, and the comma-append
    # merge.
    #
    # @api private
    module StainlessHelperHeader
      # Telemetry header naming the SDK helper(s) a request came from. Always
      # this lowercase form; header lookups are case-insensitive but a single
      # canonical casing keeps every call site greppable.
      HEADER = "x-stainless-helper"

      # Closed value vocabulary. Existing values keep their original spellings —
      # telemetry consumers match on them, so renames lose history. New tags are
      # hyphenated lowercase.
      BETA_TOOL_RUNNER = "BetaToolRunner"
      FALLBACK_REFUSAL_MIDDLEWARE = "fallback-refusal-middleware"

      class << self
        # The {HEADER} value to set after appending `value` to whatever is
        # already present in `headers` — existing tags keep their position, the
        # new tag goes at the end, duplicates are dropped, joined as one
        # comma-separated string. The backend logs the header as one opaque
        # string, so a second header line or a clobbered value loses data.
        #
        # @param headers [Hash{String => String}]
        # @param value [String]
        # @return [String]
        def merged_value(headers, value)
          existing =
            headers
            .filter_map { |k, v| v if k.to_s.casecmp?(HEADER) }
            .flat_map { _1.to_s.split(",") }
            .map(&:strip)
            .reject(&:empty?)
          (existing + [value]).uniq.join(", ")
        end
      end
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    class CacheMissUnavailable < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :unavailable]
      required :type, const: :unavailable

      # @!method initialize(type: :unavailable)
      #   A `cache_miss_reason` for when the API can't give a diagnosis. The request
      #   itself was processed normally.
      #
      #   This includes a request whose `model`, `system`, and `tools` match the previous
      #   request's but whose other prompt-affecting parameters, such as `thinking` or
      #   `tool_choice`, differ.
      #
      #   See the
      #   [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types)
      #   to learn what to change for each reason.
      #
      #   @param type [Symbol, :unavailable]
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    class CacheControlEphemeral < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :ephemeral]
      required :type, const: :ephemeral

      # @!attribute ttl
      #   The time-to-live for the cache control breakpoint.
      #
      #   This may be one the following values:
      #
      #   - `5m`: 5 minutes
      #   - `1h`: 1 hour
      #
      #   Defaults to `5m`.
      #
      #   @return [Symbol, Anthropic::Models::CacheControlEphemeral::TTL, nil]
      optional :ttl, enum: -> { Anthropic::CacheControlEphemeral::TTL }

      # @!method initialize(ttl: nil, type: :ephemeral)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::CacheControlEphemeral} for more details.
      #
      #   @param ttl [Symbol, Anthropic::Models::CacheControlEphemeral::TTL] The time-to-live for the cache control breakpoint.
      #
      #   @param type [Symbol, :ephemeral]

      # The time-to-live for the cache control breakpoint.
      #
      # This may be one the following values:
      #
      # - `5m`: 5 minutes
      # - `1h`: 1 hour
      #
      # Defaults to `5m`.
      #
      # @see Anthropic::Models::CacheControlEphemeral#ttl
      module TTL
        extend Anthropic::Internal::Type::Enum

        TTL_5M = :"5m"
        TTL_1H = :"1h"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

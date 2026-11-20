# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAvailableExternalStorageStatus < Anthropic::Internal::Type::BaseModel
          # @!attribute healthy
          #   Whether the bucket passed its latest recorded check. It can stay `true` after
          #   the bucket stops working, so don't use it for monitoring.
          #
          #   @return [Boolean]
          required :healthy, Anthropic::Internal::Type::Boolean

          # @!attribute last_checked_at
          #   When the bucket's latest recorded check ran, in RFC 3339.
          #
          #   @return [Time]
          required :last_checked_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :available]
          required :type, const: :available

          # @!method initialize(healthy:, last_checked_at:, type: :available)
          #   The storage is verified, no Workspace has it attached, and Anthropic doesn't use
          #   the bucket.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAvailableExternalStorageStatus} for
          #   more details.
          #
          #   @param healthy [Boolean] Whether the bucket passed its latest recorded check. It can stay `true` after th
          #
          #   @param last_checked_at [Time] When the bucket's latest recorded check ran, in RFC 3339.
          #
          #   @param type [Symbol, :available]
        end
      end
    end
  end
end

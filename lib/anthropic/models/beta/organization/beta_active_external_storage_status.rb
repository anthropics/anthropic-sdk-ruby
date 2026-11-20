# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaActiveExternalStorageStatus < Anthropic::Internal::Type::BaseModel
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
          #   @return [Symbol, :active]
          required :type, const: :active

          # @!method initialize(healthy:, last_checked_at:, type: :active)
          #   At least one Workspace has the storage attached.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaActiveExternalStorageStatus} for
          #   more details.
          #
          #   @param healthy [Boolean] Whether the bucket passed its latest recorded check. It can stay `true` after th
          #
          #   @param last_checked_at [Time] When the bucket's latest recorded check ran, in RFC 3339.
          #
          #   @param type [Symbol, :active]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDrainingExternalStorageStatus < Anthropic::Internal::Type::BaseModel
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

          # @!attribute removal_started
          #   True once a delete has started removing this storage, which can't be undone. It
          #   then can't be attached, and another delete finishes the removal.
          #
          #   @return [Boolean]
          required :removal_started, Anthropic::Internal::Type::Boolean

          # @!attribute type
          #
          #   @return [Symbol, :draining]
          required :type, const: :draining

          # @!method initialize(healthy:, last_checked_at:, removal_started:, type: :draining)
          #   No Workspace has the storage attached. A Workspace can attach it again, unless
          #   `removal_started` is true.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaDrainingExternalStorageStatus} for
          #   more details.
          #
          #   @param healthy [Boolean] Whether the bucket passed its latest recorded check. It can stay `true` after th
          #
          #   @param last_checked_at [Time] When the bucket's latest recorded check ran, in RFC 3339.
          #
          #   @param removal_started [Boolean] True once a delete has started removing this storage, which can't be undone. It
          #
          #   @param type [Symbol, :draining]
        end
      end
    end
  end
end

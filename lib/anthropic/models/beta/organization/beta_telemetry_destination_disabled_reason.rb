# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Why the destination is disabled: `caller` when a caller disabled it, or the
        # reason the API disabled it automatically (`sustained_failure`,
        # `invalid_address`, or `redirect`). Every automatic disable is reversible with an
        # update that sets `state` to `enabled`. An update that sets `disabled` on a
        # destination that is already disabled keeps its reason.
        module BetaTelemetryDestinationDisabledReason
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # A caller disabled the destination with an update that set `state` to `disabled`.
          variant :caller, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller }

          # The API disabled the destination because deliveries to it failed, with no successful delivery in between, for longer than a threshold that Anthropic configures and that is not part of this contract. The reason is `invalid_address` instead when the most recent failed delivery failed with an invalid address.
          variant :sustained_failure,
                  -> { Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure }

          # The API disabled the destination because deliveries to it failed for longer than the same threshold as for `sustained_failure`, and the most recent failed delivery failed with an invalid address: the DNS answer says that the endpoint's hostname doesn't exist or doesn't have an address, or the address that the API would connect to isn't publicly routable or is reserved, for example a loopback, link-local, private-network, or cloud-metadata address. The API doesn't connect to such an address, and retries the delivery a bounded number of times as it does after a timeout. A timeout or a server failure of the DNS lookup is a temporary DNS failure instead, not an invalid address.
          variant :invalid_address,
                  -> { Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress }

          # The API disabled the destination because the endpoint answered a delivery with a 3xx status. Redirects are never followed, and one such answer disables the destination at once.
          variant :redirect, -> { Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect }

          module Type
            extend Anthropic::Internal::Type::Enum

            CALLER = :caller
            SUSTAINED_FAILURE = :sustained_failure
            INVALID_ADDRESS = :invalid_address
            REDIRECT = :redirect

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReason::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress, Anthropic::Models::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect]
          def self.new(type:, **args)
            case type.to_sym
            when :caller
              Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonCaller.new(**args)
            when :sustained_failure
              Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonSustainedFailure.new(**args)
            when :invalid_address
              Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress.new(**args)
            when :redirect
              Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonRedirect.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end

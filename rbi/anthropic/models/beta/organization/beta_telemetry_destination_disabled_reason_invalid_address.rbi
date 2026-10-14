# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationDisabledReasonInvalidAddress < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTelemetryDestinationDisabledReasonInvalidAddress,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The API disabled the destination because deliveries to it failed for longer than
          # the same threshold as for `sustained_failure`, and the most recent failed
          # delivery failed with an invalid address: the DNS answer says that the endpoint's
          # hostname doesn't exist or doesn't have an address, or the address that the API
          # would connect to isn't publicly routable or is reserved, for example a loopback,
          # link-local, private-network, or cloud-metadata address. The API doesn't connect
          # to such an address, and retries the delivery a bounded number of times as it
          # does after a timeout. A timeout or a server failure of the DNS lookup is a
          # temporary DNS failure instead, not an invalid address.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :invalid_address)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

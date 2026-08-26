# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaFederationIssuerPollStatus < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus,
                  Anthropic::Internal::AnyHash
                )
              end

            # Consecutive fetch failures since the last success.
            sig { returns(Integer) }
            attr_accessor :consecutive_failures

            # When the last successful fetch completed.
            sig { returns(T.nilable(Time)) }
            attr_accessor :last_fetched_at

            # When the next fetch is scheduled. Null if paused.
            sig { returns(T.nilable(Time)) }
            attr_accessor :next_poll_at

            # Status of automatic JWKS polling for a federation issuer.
            #
            # Anthropic periodically fetches the issuer's signing keys in the background.
            # These fields summarize the most recent fetches so the health of the JWKS
            # endpoint can be monitored.
            sig do
              params(
                consecutive_failures: Integer,
                last_fetched_at: T.nilable(Time),
                next_poll_at: T.nilable(Time)
              ).returns(T.attached_class)
            end
            def self.new(
              # Consecutive fetch failures since the last success.
              consecutive_failures:,
              # When the last successful fetch completed.
              last_fetched_at:,
              # When the next fetch is scheduled. Null if paused.
              next_poll_at:
            )
            end

            sig do
              override.returns(
                {
                  consecutive_failures: Integer,
                  last_fetched_at: T.nilable(Time),
                  next_poll_at: T.nilable(Time)
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end

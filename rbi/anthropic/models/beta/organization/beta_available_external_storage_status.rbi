# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAvailableExternalStorageStatus < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAvailableExternalStorageStatus,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether the bucket passed its latest recorded check. It can stay `true` after
          # the bucket stops working, so don't use it for monitoring.
          sig { returns(T::Boolean) }
          attr_accessor :healthy

          # When the bucket's latest recorded check ran, in RFC 3339.
          sig { returns(Time) }
          attr_accessor :last_checked_at

          sig { returns(Symbol) }
          attr_accessor :type

          # The storage is verified, no Workspace has it attached, and Anthropic doesn't use
          # the bucket.
          sig do
            params(
              healthy: T::Boolean,
              last_checked_at: Time,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the bucket passed its latest recorded check. It can stay `true` after
            # the bucket stops working, so don't use it for monitoring.
            healthy:,
            # When the bucket's latest recorded check ran, in RFC 3339.
            last_checked_at:,
            type: :available
          )
          end

          sig do
            override.returns(
              { healthy: T::Boolean, last_checked_at: Time, type: Symbol }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end

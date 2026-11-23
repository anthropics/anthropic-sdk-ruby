# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDrainingExternalStorageStatus < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaDrainingExternalStorageStatus,
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

          # True once a delete has started removing this storage, which can't be undone. It
          # then can't be attached, and another delete finishes the removal.
          sig { returns(T::Boolean) }
          attr_accessor :removal_started

          sig { returns(Symbol) }
          attr_accessor :type

          # No Workspace has the storage attached. A Workspace can attach it again, unless
          # `removal_started` is true.
          sig do
            params(
              healthy: T::Boolean,
              last_checked_at: Time,
              removal_started: T::Boolean,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the bucket passed its latest recorded check. It can stay `true` after
            # the bucket stops working, so don't use it for monitoring.
            healthy:,
            # When the bucket's latest recorded check ran, in RFC 3339.
            last_checked_at:,
            # True once a delete has started removing this storage, which can't be undone. It
            # then can't be attached, and another delete finishes the removal.
            removal_started:,
            type: :draining
          )
          end

          sig do
            override.returns(
              {
                healthy: T::Boolean,
                last_checked_at: Time,
                removal_started: T::Boolean,
                type: Symbol
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

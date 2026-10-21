# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsScheduleTriggerContext =
      Beta::BetaManagedAgentsScheduleTriggerContext

    module Beta
      class BetaManagedAgentsScheduleTriggerContext < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext,
              Anthropic::Internal::AnyHash
            )
          end

        # The UTC instant at which the cron expression matched in the configured timezone,
        # before jitter is applied. At most one run is recorded per (`deployment_id`,
        # `scheduled_at`) pair.
        sig { returns(Time) }
        attr_accessor :scheduled_at

        sig { returns(Symbol) }
        attr_accessor :type

        # The run was fired by the deployment's cron schedule.
        sig do
          params(scheduled_at: Time, type: Symbol).returns(T.attached_class)
        end
        def self.new(
          # The UTC instant at which the cron expression matched in the configured timezone,
          # before jitter is applied. At most one run is recorded per (`deployment_id`,
          # `scheduled_at`) pair.
          scheduled_at:,
          type: :schedule
        )
        end

        sig { override.returns({ scheduled_at: Time, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

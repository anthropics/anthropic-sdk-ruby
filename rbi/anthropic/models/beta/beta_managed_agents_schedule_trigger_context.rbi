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

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :scheduled_at

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The run was fired by the deployment's cron schedule.
        sig do
          params(
            scheduled_at: Time,
            type:
              Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A timestamp in RFC 3339 format
          scheduled_at:,
          type:
        )
        end

        sig do
          override.returns(
            {
              scheduled_at: Time,
              type:
                Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SCHEDULE =
            T.let(
              :schedule,
              Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsTriggerContext = Beta::BetaManagedAgentsTriggerContext

    module Beta
      # Describes what triggered a deployment run, with trigger-specific metadata.
      module BetaManagedAgentsTriggerContext
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext,
              Anthropic::Beta::BetaManagedAgentsManualTriggerContext
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsTriggerContext::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SCHEDULE =
            T.let(
              :schedule,
              Anthropic::Beta::BetaManagedAgentsTriggerContext::Type::TaggedSymbol
            )
          MANUAL =
            T.let(
              :manual,
              Anthropic::Beta::BetaManagedAgentsTriggerContext::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsTriggerContext::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsTriggerContext::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(type: T.any(Symbol, String), scheduled_at: Time).returns(
            Anthropic::Beta::BetaManagedAgentsTriggerContext::Variants
          )
        end
        def self.new(
          type:,
          # A timestamp in RFC 3339 format
          scheduled_at: nil
        )
        end
      end
    end
  end
end

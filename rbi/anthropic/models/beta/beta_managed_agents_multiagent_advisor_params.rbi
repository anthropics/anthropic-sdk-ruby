# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentAdvisorParams =
      Beta::BetaManagedAgentsMultiagentAdvisorParams

    module Beta
      # Whether the session's primary thread can consult an advisor model.
      module BetaManagedAgentsMultiagentAdvisorParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams,
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorParams::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorParams::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorParams::Type::OrSymbol,
            model: String
          ).returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorParams::Variants
          )
        end
        def self.new(
          type:,
          # A Claude model id. The model must be permitted as an advisor for this agent's
          # model.
          model: nil
        )
        end
      end
    end
  end
end

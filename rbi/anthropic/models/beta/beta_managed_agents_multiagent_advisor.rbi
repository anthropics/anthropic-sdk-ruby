# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentAdvisor =
      Beta::BetaManagedAgentsMultiagentAdvisor

    module Beta
      # Whether the session's primary thread can consult an advisor model.
      module BetaManagedAgentsMultiagentAdvisor
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabled
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Variants
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
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Type::OrSymbol,
            model: String
          ).returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor::Variants
          )
        end
        def self.new(
          type:,
          # The advisor model id.
          model: nil
        )
        end
      end
    end
  end
end

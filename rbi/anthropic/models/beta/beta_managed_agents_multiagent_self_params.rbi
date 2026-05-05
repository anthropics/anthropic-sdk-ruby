# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentSelfParams =
      Beta::BetaManagedAgentsMultiagentSelfParams

    module Beta
      class BetaManagedAgentsMultiagentSelfParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Sentinel roster entry meaning "the agent that owns this configuration". Resolved
        # server-side to a concrete agent reference.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SELF =
            T.let(
              :self,
              Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::Type::TaggedSymbol
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

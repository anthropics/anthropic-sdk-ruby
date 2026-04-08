# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsBranchCheckout = Beta::BetaManagedAgentsBranchCheckout

    module Beta
      class BetaManagedAgentsBranchCheckout < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsBranchCheckout,
              Anthropic::Internal::AnyHash
            )
          end

        # Branch name to check out.
        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsBranchCheckout::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            name: String,
            type:
              Anthropic::Beta::BetaManagedAgentsBranchCheckout::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Branch name to check out.
          name:,
          type:
        )
        end

        sig do
          override.returns(
            {
              name: String,
              type:
                Anthropic::Beta::BetaManagedAgentsBranchCheckout::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsBranchCheckout::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BRANCH =
            T.let(
              :branch,
              Anthropic::Beta::BetaManagedAgentsBranchCheckout::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsBranchCheckout::Type::TaggedSymbol
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

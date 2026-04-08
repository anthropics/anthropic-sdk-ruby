# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCommitCheckout = Beta::BetaManagedAgentsCommitCheckout

    module Beta
      class BetaManagedAgentsCommitCheckout < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCommitCheckout,
              Anthropic::Internal::AnyHash
            )
          end

        # Full commit SHA to check out.
        sig { returns(String) }
        attr_accessor :sha

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsCommitCheckout::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            sha: String,
            type:
              Anthropic::Beta::BetaManagedAgentsCommitCheckout::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Full commit SHA to check out.
          sha:,
          type:
        )
        end

        sig do
          override.returns(
            {
              sha: String,
              type:
                Anthropic::Beta::BetaManagedAgentsCommitCheckout::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsCommitCheckout::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COMMIT =
            T.let(
              :commit,
              Anthropic::Beta::BetaManagedAgentsCommitCheckout::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsCommitCheckout::Type::TaggedSymbol
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

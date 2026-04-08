# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusTerminal < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The session encountered a terminal error and will transition to `terminated`
          # state.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TERMINAL =
              T.let(
                :terminal,
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type::TaggedSymbol
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
end

# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusExhausted < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # This turn is dead; queued inputs are flushed and the session returns to idle.
          # Client may send a new prompt.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXHAUSTED =
              T.let(
                :exhausted,
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type::TaggedSymbol
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

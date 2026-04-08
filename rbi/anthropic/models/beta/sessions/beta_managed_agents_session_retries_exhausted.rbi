# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRetriesExhausted < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The turn ended because the retry budget was exhausted (`max_iterations` hit or
          # an error escalated to `retry_status: 'exhausted'`).
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            RETRIES_EXHAUSTED =
              T.let(
                :retries_exhausted,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type::TaggedSymbol
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

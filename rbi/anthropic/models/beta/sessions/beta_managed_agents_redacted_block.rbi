# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRedactedBlock < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Placeholder for content withheld by Anthropic model policy.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type::OrSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            REDACTED =
              T.let(
                :redacted,
                Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type::TaggedSymbol
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

# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusRetrying < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The server is retrying automatically. Client should wait; the same error type
          # may fire again as retrying, then once as exhausted when the retry budget runs
          # out.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            RETRYING =
              T.let(
                :retrying,
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type::TaggedSymbol
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

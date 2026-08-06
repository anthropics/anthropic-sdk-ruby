# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAdvisor = Beta::BetaManagedAgentsAdvisor

    module Beta
      class BetaManagedAgentsAdvisor < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAdvisor,
              Anthropic::Internal::AnyHash
            )
          end

        # The advisor model id.
        sig { returns(String) }
        attr_accessor :model

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsAdvisor::Type::TaggedSymbol)
        end
        attr_accessor :type

        # Platform advisor roster entry: a model the session's primary thread may consult
        # mid-turn.
        sig do
          params(
            model: String,
            type: Anthropic::Beta::BetaManagedAgentsAdvisor::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The advisor model id.
          model:,
          type:
        )
        end

        sig do
          override.returns(
            {
              model: String,
              type:
                Anthropic::Beta::BetaManagedAgentsAdvisor::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsAdvisor::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ADVISOR =
            T.let(
              :advisor,
              Anthropic::Beta::BetaManagedAgentsAdvisor::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAdvisor::Type::TaggedSymbol
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

# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAdvisorParams = Beta::BetaManagedAgentsAdvisorParams

    module Beta
      class BetaManagedAgentsAdvisorParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAdvisorParams,
              Anthropic::Internal::AnyHash
            )
          end

        # A Claude model id. The model must be permitted as an advisor for this agent's
        # model — see the sessions/threads/advisor spec.
        sig { returns(String) }
        attr_accessor :model

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAdvisorParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Platform advisor roster entry: a model the session's primary thread may consult
        # mid-turn. At most one per roster; the entry occupies the roster name
        # `anthropic.advisor`.
        sig do
          params(
            model: String,
            type:
              Anthropic::Beta::BetaManagedAgentsAdvisorParams::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A Claude model id. The model must be permitted as an advisor for this agent's
          # model — see the sessions/threads/advisor spec.
          model:,
          type:
        )
        end

        sig do
          override.returns(
            {
              model: String,
              type:
                Anthropic::Beta::BetaManagedAgentsAdvisorParams::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsAdvisorParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ADVISOR =
            T.let(
              :advisor,
              Anthropic::Beta::BetaManagedAgentsAdvisorParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAdvisorParams::Type::TaggedSymbol
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

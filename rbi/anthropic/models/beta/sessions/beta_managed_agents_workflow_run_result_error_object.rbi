# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunResultErrorObject < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultErrorObject,
                Anthropic::Internal::AnyHash
              )
            end

          # Why the run did not finish.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunErrorObject::Variants
            )
          end
          attr_accessor :error

          sig { returns(Symbol) }
          attr_accessor :type

          # The run failed or reached its time limit.
          sig do
            params(
              error:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunErrorObject::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunErrorObject::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunErrorObject::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunErrorObject::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunErrorObject::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Why the run did not finish.
            error:,
            type: :error
          )
          end

          sig do
            override.returns(
              {
                error:
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunErrorObject::Variants,
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end

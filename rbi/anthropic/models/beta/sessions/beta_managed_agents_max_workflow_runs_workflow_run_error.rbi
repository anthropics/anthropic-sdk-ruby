# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsMaxWorkflowRunsWorkflowRunError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError,
                Anthropic::Internal::AnyHash
              )
            end

          # Short explanation written by the server. It never contains content from the run
          # or its agents.
          sig { returns(String) }
          attr_accessor :message

          sig { returns(Symbol) }
          attr_accessor :type

          # No run was created, because the session was at its limit of open workflow runs,
          # which are runs that have not ended. Only `workflow_run.error` carries this type.
          sig do
            params(message: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Short explanation written by the server. It never contains content from the run
            # or its agents.
            message:,
            type: :max_workflow_runs_error
          )
          end

          sig { override.returns({ message: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

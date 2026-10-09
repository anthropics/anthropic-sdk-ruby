# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsProgramWorkflowRunError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError,
                Anthropic::Internal::AnyHash
              )
            end

          # Short explanation written by the server. It never contains content from the run
          # or its agents.
          sig { returns(String) }
          attr_accessor :message

          sig { returns(Symbol) }
          attr_accessor :type

          # The plan, a program that the agent wrote, failed, or the server refused it.
          sig do
            params(message: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Short explanation written by the server. It never contains content from the run
            # or its agents.
            message:,
            type: :program_error
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

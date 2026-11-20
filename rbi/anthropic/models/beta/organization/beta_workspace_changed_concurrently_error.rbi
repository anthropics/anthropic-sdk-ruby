# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Another request changed the Workspace, so this request left the setting named in
        # `field` as it is. The error's `message` says which of this request's other
        # changes are in place. Read the Workspace and send the request again if you still
        # want the change.
        class BetaWorkspaceChangedConcurrentlyError < Anthropic::Errors::ConflictError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end

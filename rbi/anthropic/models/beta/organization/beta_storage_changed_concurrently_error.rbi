# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Another request changed this storage setting while this one was running, so this
        # request left it as it is. Read the Workspace and send the request again if you
        # still want the change.
        class BetaStorageChangedConcurrentlyError < Anthropic::Errors::ConflictError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaStorageChangedConcurrentlyErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module Organization
      # The External Key can't be deleted or reconfigured while the organization's
      # Workspace Policy lists it as an allowed key.
      class ExternalKeyInWorkspacePolicyError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::ExternalKeyInWorkspacePolicyErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end

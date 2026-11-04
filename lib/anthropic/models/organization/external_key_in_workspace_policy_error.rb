# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The External Key can't be deleted or reconfigured while the organization's
      # Workspace Policy lists it as an allowed key.
      class ExternalKeyInWorkspacePolicyError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :external_key_in_workspace_policy]

        # @return [Anthropic::Models::Organization::ExternalKeyInWorkspacePolicyErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::ExternalKeyInWorkspacePolicyErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end

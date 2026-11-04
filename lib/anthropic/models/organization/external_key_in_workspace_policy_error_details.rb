# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class ExternalKeyInWorkspacePolicyErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :external_key_in_workspace_policy]
        required :error_code, const: :external_key_in_workspace_policy

        # @!method initialize(error_code: :external_key_in_workspace_policy)
        #   The External Key can't be deleted or reconfigured while the organization's
        #   Workspace Policy lists it as an allowed key.
        #
        #   @param error_code [Symbol, :external_key_in_workspace_policy]
      end
    end
  end
end

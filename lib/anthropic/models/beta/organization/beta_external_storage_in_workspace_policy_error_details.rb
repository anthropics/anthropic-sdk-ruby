# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageInWorkspacePolicyErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :external_storage_in_workspace_policy]
          required :error_code, const: :external_storage_in_workspace_policy

          # @!method initialize(error_code: :external_storage_in_workspace_policy)
          #   The External Storage can't be deleted while an Enterprise Frontier Safeguards
          #   workspace policy lists it as allowed storage.
          #
          #   @param error_code [Symbol, :external_storage_in_workspace_policy]
        end
      end
    end
  end
end

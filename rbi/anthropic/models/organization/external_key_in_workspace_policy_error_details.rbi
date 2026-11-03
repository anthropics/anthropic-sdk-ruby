# typed: strong

module Anthropic
  module Models
    module Organization
      class ExternalKeyInWorkspacePolicyErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ExternalKeyInWorkspacePolicyErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The External Key can't be deleted or reconfigured while the organization's
        # Workspace Policy lists it as an allowed key.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :external_key_in_workspace_policy)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

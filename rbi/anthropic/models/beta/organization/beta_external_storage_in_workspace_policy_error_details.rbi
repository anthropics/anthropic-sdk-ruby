# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageInWorkspacePolicyErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaExternalStorageInWorkspacePolicyErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The External Storage can't be deleted while an Enterprise Frontier Safeguards
          # workspace policy lists it as allowed storage.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :external_storage_in_workspace_policy)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

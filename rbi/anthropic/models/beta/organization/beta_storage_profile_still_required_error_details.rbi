# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageProfileStillRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaStorageProfileStillRequiredErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # This storage is bound to a different user profile from storage the Workspace has
          # attached, or from active or draining storage it once had for safeguards data.
          # Detaching storage the Workspace uses only for transcripts clears this. Detaching
          # safeguards storage doesn't, so use a new Workspace instead.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :storage_profile_still_required)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The credential is not a scoped API key that is bound at the organization level.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :organization_level_scoped_api_key_required)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

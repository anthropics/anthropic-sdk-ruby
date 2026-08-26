# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyOrganizationScope < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAPIKeyOrganizationScope,
                Anthropic::Internal::AnyHash
              )
            end

          # Scope type. Always `"organization"`: the API key has no Workspace. Only a
          # principal-bound API key can have this scope.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # Scope type. Always `"organization"`: the API key has no Workspace. Only a
            # principal-bound API key can have this scope.
            type: :organization
          )
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

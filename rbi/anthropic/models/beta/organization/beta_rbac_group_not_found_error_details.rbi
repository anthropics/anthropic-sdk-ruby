# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaRBACGroupNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaRBACGroupNotFoundErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The RBAC Group is not one of the organization's groups.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :rbac_group_not_found)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

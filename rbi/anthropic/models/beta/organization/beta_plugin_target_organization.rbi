# typed: strong

module Anthropic
  module Models
    module Beta
      BetaPluginTargetOrganization = Organization::BetaPluginTargetOrganization

      module Organization
        class BetaPluginTargetOrganization < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginTargetOrganization,
                Anthropic::Internal::AnyHash
              )
            end

          # Every member of the organization.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # Every member of the organization.
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

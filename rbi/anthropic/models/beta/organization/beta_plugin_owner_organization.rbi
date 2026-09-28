# typed: strong

module Anthropic
  module Models
    module Beta
      BetaPluginOwnerOrganization = Organization::BetaPluginOwnerOrganization

      module Organization
        class BetaPluginOwnerOrganization < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginOwnerOrganization,
                Anthropic::Internal::AnyHash
              )
            end

          # The Plugin lives in a plugin marketplace the organization owns.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # The Plugin lives in a plugin marketplace the organization owns.
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

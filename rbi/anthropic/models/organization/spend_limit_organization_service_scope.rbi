# typed: strong

module Anthropic
  module Models
    module Organization
      class SpendLimitOrganizationServiceScope < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::SpendLimitOrganizationServiceScope,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :service

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(service: String, type: Symbol).returns(T.attached_class) }
        def self.new(service:, type: :organization_service)
        end

        sig { override.returns({ service: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

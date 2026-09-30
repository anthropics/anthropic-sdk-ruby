# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitOrganizationServiceScope < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSpendLimitOrganizationServiceScope,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :service

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(service: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(service:, type: :organization_service)
          end

          sig { override.returns({ service: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaComplianceSettingsStateDisabledParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabledParam,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :disabled)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

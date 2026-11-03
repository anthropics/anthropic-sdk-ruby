# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaComplianceConfigurationRestrictedErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The organization's compliance configuration does not let Claude Tag store
          # anything new.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :compliance_configuration_restricted)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

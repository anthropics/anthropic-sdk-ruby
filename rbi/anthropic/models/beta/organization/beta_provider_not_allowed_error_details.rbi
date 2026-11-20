# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaProviderNotAllowedErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaProviderNotAllowedErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The request can't use External Storage on this cloud provider. The error's
          # message says why.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :provider_not_allowed)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageAlreadyRegisteredErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaStorageAlreadyRegisteredErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The organization already has External Storage for this bucket that it has not
          # deleted. List the organization's External Storage to find it.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :storage_already_registered)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

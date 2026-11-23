# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageInUseErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaExternalStorageInUseErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The External Storage is `active` or `draining`, so this delete didn't erase it.
          # The message says what to do next. On `draining` storage this delete may have
          # started a removal that can't be undone: get the storage and read
          # `status.removal_started`.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :external_storage_in_use)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

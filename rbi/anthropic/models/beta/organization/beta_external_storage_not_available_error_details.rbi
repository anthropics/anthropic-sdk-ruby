# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageNotAvailableErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaExternalStorageNotAvailableErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # External Storage isn't available for this Workspace, so only `internal` storage
          # is accepted. The error's `message` says why.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :external_storage_not_available)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

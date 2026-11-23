# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageNotAttachableErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaStorageNotAttachableErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The request field at fault.
          sig { returns(String) }
          attr_accessor :field

          # This External Storage can't be attached to the setting named in `field`. The
          # error's `message` says why.
          sig do
            params(field: String, error_code: Symbol).returns(T.attached_class)
          end
          def self.new(
            # The request field at fault.
            field:,
            error_code: :storage_not_attachable
          )
          end

          sig { override.returns({ error_code: Symbol, field: String }) }
          def to_hash
          end
        end
      end
    end
  end
end

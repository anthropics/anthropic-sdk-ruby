# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageAttachLimitReachedErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaStorageAttachLimitReachedErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The Workspace has reached its limit of 100 different External Storage resources
          # attached over its lifetime. Detached storage counts toward the limit until it is
          # deleted.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :storage_attach_limit_reached)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

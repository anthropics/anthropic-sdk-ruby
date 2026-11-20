# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageChangedConcurrentlyErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaStorageChangedConcurrentlyErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The storage setting that changed.
          sig { returns(String) }
          attr_accessor :field

          # Another request changed this storage setting while this one was running, so this
          # request left it as it is. Read the Workspace and send the request again if you
          # still want the change.
          sig do
            params(field: String, error_code: Symbol).returns(T.attached_class)
          end
          def self.new(
            # The storage setting that changed.
            field:,
            error_code: :storage_changed_concurrently
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

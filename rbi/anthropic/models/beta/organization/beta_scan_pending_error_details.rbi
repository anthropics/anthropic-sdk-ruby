# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaScanPendingErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaScanPendingErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          sig { returns(String) }
          attr_accessor :plugin_version_id

          # The content scan of the version in `plugin_version_id` is still running. Retry
          # once the scan finishes.
          sig do
            params(plugin_version_id: String, error_code: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(plugin_version_id:, error_code: :scan_pending)
          end

          sig do
            override.returns({ error_code: Symbol, plugin_version_id: String })
          end
          def to_hash
          end
        end
      end
    end
  end
end

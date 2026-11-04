# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaRegistrationPendingErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaRegistrationPendingErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          sig { returns(String) }
          attr_accessor :plugin_id

          sig { returns(String) }
          attr_accessor :plugin_version_id

          # The Plugin version was stored but is not yet usable in claude.ai. `plugin_id`
          # and `plugin_version_id` identify what was stored.
          sig do
            params(
              plugin_id: String,
              plugin_version_id: String,
              error_code: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            plugin_id:,
            plugin_version_id:,
            error_code: :registration_pending
          )
          end

          sig do
            override.returns(
              {
                error_code: Symbol,
                plugin_id: String,
                plugin_version_id: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end

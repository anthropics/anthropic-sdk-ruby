# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginNameTakenErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginNameTakenErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          sig { returns(T.nilable(String)) }
          attr_accessor :plugin_id

          # The marketplace already holds this name. `plugin_id` is the Plugin that holds
          # it, and can be absent.
          sig do
            params(plugin_id: T.nilable(String), error_code: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(plugin_id: nil, error_code: :plugin_name_taken)
          end

          sig do
            override.returns(
              { error_code: Symbol, plugin_id: T.nilable(String) }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end

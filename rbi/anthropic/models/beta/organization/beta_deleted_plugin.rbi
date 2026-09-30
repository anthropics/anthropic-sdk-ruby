# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDeletedPlugin < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaDeletedPlugin,
                Anthropic::Internal::AnyHash
              )
            end

          # The deleted Plugin's ID.
          sig { returns(String) }
          attr_accessor :id

          # Always `plugin_deleted`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # The deleted Plugin's ID.
            id:,
            # Always `plugin_deleted`.
            type: :plugin_deleted
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

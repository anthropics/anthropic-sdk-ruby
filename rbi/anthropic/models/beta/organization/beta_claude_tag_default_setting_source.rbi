# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagDefaultSettingSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # No settings level sets a value, and the built-in default applies.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :default)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

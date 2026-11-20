# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInternalStorageParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaInternalStorageParam,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # No External Storage for this purpose.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :internal)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

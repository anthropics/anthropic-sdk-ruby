# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPendingConfigurationExternalStorageStatus < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPendingConfigurationExternalStorageStatus,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The storage isn't verified yet.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :pending_configuration)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

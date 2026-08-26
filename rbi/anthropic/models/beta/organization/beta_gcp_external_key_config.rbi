# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaGCPExternalKeyConfig < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaGCPExternalKeyConfig,
                Anthropic::Internal::AnyHash
              )
            end

          # Full resource name of the Cloud KMS key.
          sig { returns(String) }
          attr_accessor :key_name

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(key_name: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Full resource name of the Cloud KMS key.
            key_name:,
            type: :gcp
          )
          end

          sig { override.returns({ key_name: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

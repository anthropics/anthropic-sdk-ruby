# typed: strong

module Anthropic
  module Models
    module Organization
      class GCPExternalKeyConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::GCPExternalKeyConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # Full resource name of the Cloud KMS key.
        sig { returns(String) }
        attr_accessor :key_name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(key_name: String, type: Symbol).returns(T.attached_class) }
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

# typed: strong

module Anthropic
  module Models
    module Organization
      class SpendLimitScopedAPIKeyActor < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::SpendLimitScopedAPIKeyActor,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :scoped_api_key_id

        sig { returns(Symbol) }
        attr_accessor :type

        # A scoped Admin API key acting on behalf of the organization.
        sig do
          params(scoped_api_key_id: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(scoped_api_key_id:, type: :scoped_api_key_actor)
        end

        sig { override.returns({ scoped_api_key_id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

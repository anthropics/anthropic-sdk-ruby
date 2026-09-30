# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginAPIActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginAPIActor,
                Anthropic::Internal::AnyHash
              )
            end

          # The key's ID.
          sig { returns(String) }
          attr_accessor :api_key_id

          # An Admin API key, in the same form the Compliance API activity feed uses for it.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(api_key_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # The key's ID.
            api_key_id:,
            # An Admin API key, in the same form the Compliance API activity feed uses for it.
            type: :api_actor
          )
          end

          sig { override.returns({ api_key_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsAPIActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsAPIActor,
                Anthropic::Internal::AnyHash
              )
            end

          # Tagged API key ID.
          sig { returns(String) }
          attr_accessor :api_key_id

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(api_key_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Tagged API key ID.
            api_key_id:,
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

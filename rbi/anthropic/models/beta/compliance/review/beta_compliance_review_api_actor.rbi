# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewAPIActor < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewAPIActor,
                  Anthropic::Internal::AnyHash
                )
              end

            # The ID of the API key (`apikey_...`).
            sig { returns(String) }
            attr_accessor :api_key_id

            sig { returns(Symbol) }
            attr_accessor :type

            # An API key.
            sig do
              params(api_key_id: String, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # The ID of the API key (`apikey_...`).
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
end

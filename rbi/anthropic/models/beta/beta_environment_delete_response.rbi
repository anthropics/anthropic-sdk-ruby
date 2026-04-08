# typed: strong

module Anthropic
  module Models
    BetaEnvironmentDeleteResponse = Beta::BetaEnvironmentDeleteResponse

    module Beta
      class BetaEnvironmentDeleteResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEnvironmentDeleteResponse,
              Anthropic::Internal::AnyHash
            )
          end

        # Environment identifier
        sig { returns(String) }
        attr_accessor :id

        # The type of response
        sig { returns(Symbol) }
        attr_accessor :type

        # Response after deleting an environment.
        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Environment identifier
          id:,
          # The type of response
          type: :environment_deleted
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

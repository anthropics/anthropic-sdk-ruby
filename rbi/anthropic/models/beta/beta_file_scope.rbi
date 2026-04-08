# typed: strong

module Anthropic
  module Models
    BetaFileScope = Beta::BetaFileScope

    module Beta
      class BetaFileScope < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaFileScope, Anthropic::Internal::AnyHash)
          end

        # The ID of the scoping resource (e.g., the session ID).
        sig { returns(String) }
        attr_accessor :id

        # The type of scope (e.g., `"session"`).
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The ID of the scoping resource (e.g., the session ID).
          id:,
          # The type of scope (e.g., `"session"`).
          type: :session
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

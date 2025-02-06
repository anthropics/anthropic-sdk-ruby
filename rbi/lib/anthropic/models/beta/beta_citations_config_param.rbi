# typed: strong

module Anthropic
  module Models
    BetaCitationsConfigParam = T.type_alias { Beta::BetaCitationsConfigParam }

    module Beta
      class BetaCitationsConfigParam < Anthropic::BaseModel
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        sig { params(enabled: T::Boolean).void }
        def initialize(enabled: nil)
        end

        sig { override.returns({enabled: T::Boolean}) }
        def to_hash
        end
      end
    end
  end
end

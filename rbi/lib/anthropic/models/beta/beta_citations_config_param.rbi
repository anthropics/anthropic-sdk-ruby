# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaCitationsConfigParam < Anthropic::BaseModel
        sig { returns(T.nilable(T::Boolean)) }
        def enabled
        end

        sig { params(_: T::Boolean).returns(T::Boolean) }
        def enabled=(_)
        end

        sig { params(enabled: T::Boolean).returns(T.attached_class) }
        def self.new(enabled: nil)
        end

        sig { override.returns({enabled: T::Boolean}) }
        def to_hash
        end
      end
    end

    BetaCitationsConfigParam = Beta::BetaCitationsConfigParam
  end
end

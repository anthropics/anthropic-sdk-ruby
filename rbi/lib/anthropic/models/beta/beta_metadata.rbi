# typed: strong

module Anthropic
  module Models
    BetaMetadata = T.type_alias { Beta::BetaMetadata }

    module Beta
      class BetaMetadata < Anthropic::BaseModel
        sig { returns(T.nilable(String)) }
        attr_accessor :user_id

        sig { params(user_id: T.nilable(String)).void }
        def initialize(user_id: nil); end

        sig { override.returns({user_id: T.nilable(String)}) }
        def to_hash; end
      end
    end
  end
end

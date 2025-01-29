# typed: strong

module Anthropic
  module Models
    BetaMetadata = T.type_alias { Beta::BetaMetadata }

    module Beta
      class BetaMetadata < Anthropic::BaseModel
        Shape = T.type_alias { {user_id: T.nilable(String)} }

        sig { returns(T.nilable(String)) }
        attr_accessor :user_id

        sig { params(user_id: T.nilable(String)).void }
        def initialize(user_id: nil); end

        sig { returns(Anthropic::Models::Beta::BetaMetadata::Shape) }
        def to_h; end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    BetaModelInfo = T.type_alias { Beta::BetaModelInfo }

    module Beta
      class BetaModelInfo < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :display_name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, created_at: Time, display_name: String, type: Symbol).void }
        def initialize(id:, created_at:, display_name:, type: :model)
        end

        sig { override.returns({id: String, created_at: Time, display_name: String, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end

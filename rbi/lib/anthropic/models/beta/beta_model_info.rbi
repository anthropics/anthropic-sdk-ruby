# typed: strong

module Anthropic
  module Models
    BetaModelInfo = T.type_alias { Beta::BetaModelInfo }

    module Beta
      class BetaModelInfo < Anthropic::BaseModel
        sig { returns(String) }
        def id
        end

        sig { params(_: String).returns(String) }
        def id=(_)
        end

        sig { returns(Time) }
        def created_at
        end

        sig { params(_: Time).returns(Time) }
        def created_at=(_)
        end

        sig { returns(String) }
        def display_name
        end

        sig { params(_: String).returns(String) }
        def display_name=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig do
          params(id: String, created_at: Time, display_name: String, type: Symbol).returns(T.attached_class)
        end
        def self.new(id:, created_at:, display_name:, type: :model)
        end

        sig { override.returns({id: String, created_at: Time, display_name: String, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end

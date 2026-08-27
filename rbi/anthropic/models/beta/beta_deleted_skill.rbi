# typed: strong

module Anthropic
  module Models
    BetaDeletedSkill = Beta::BetaDeletedSkill

    module Beta
      class BetaDeletedSkill < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDeletedSkill,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        sig { returns(String) }
        attr_accessor :id

        # Deleted object type.
        #
        # For Skills, this is always `"skill_deleted"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          id:,
          # Deleted object type.
          #
          # For Skills, this is always `"skill_deleted"`.
          type: :skill_deleted
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end

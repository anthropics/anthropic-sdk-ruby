# typed: strong

module Anthropic
  module Models
    module Beta
      class SkillDeleteResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Models::Beta::SkillDeleteResponse,
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
        sig { returns(String) }
        attr_accessor :type

        sig { params(id: String, type: String).returns(T.attached_class) }
        def self.new(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          id:,
          # Deleted object type.
          #
          # For Skills, this is always `"skill_deleted"`.
          type:
        )
        end

        sig { override.returns({ id: String, type: String }) }
        def to_hash
        end
      end
    end
  end
end

# typed: strong

module Anthropic
  module Models
    module Beta
      module Skills
        class BetaDeletedSkillVersion < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Skills::BetaDeletedSkillVersion,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this Skill Version. The id addresses the version in paths
          # and pins it in references.
          sig { returns(String) }
          attr_accessor :id

          # Deleted object type.
          #
          # For Skill Versions, this is always `"skill_version_deleted"`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # Unique identifier for this Skill Version. The id addresses the version in paths
            # and pins it in references.
            id:,
            # Deleted object type.
            #
            # For Skill Versions, this is always `"skill_version_deleted"`.
            type: :skill_version_deleted
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end

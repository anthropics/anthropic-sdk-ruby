# typed: strong

module Anthropic
  module Models
    module Beta
      module Skills
        class BetaSkillVersion < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Skills::BetaSkillVersion,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this Skill Version. The id addresses the version in paths
          # and pins it in references.
          sig { returns(String) }
          attr_accessor :id

          # ISO 8601 timestamp of when the skill was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # Description of the skill version.
          #
          # This is extracted from the SKILL.md file in the skill upload.
          sig { returns(String) }
          attr_accessor :description

          # The Skill's immutable kebab-case slug, set at creation from the first upload's
          # SKILL.md frontmatter `name` (or its enclosing directory). Every later upload
          # must resolve to the same value. Also the top-level directory of the Skill's
          # mounted files and the base name of a downloaded archive.
          sig { returns(String) }
          attr_accessor :name

          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          sig { returns(String) }
          attr_accessor :skill_id

          # Object type.
          #
          # For Skill Versions, this is always `"skill_version"`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              id: String,
              created_at: Time,
              description: String,
              name: String,
              skill_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this Skill Version. The id addresses the version in paths
            # and pins it in references.
            id:,
            # ISO 8601 timestamp of when the skill was created.
            created_at:,
            # Description of the skill version.
            #
            # This is extracted from the SKILL.md file in the skill upload.
            description:,
            # The Skill's immutable kebab-case slug, set at creation from the first upload's
            # SKILL.md frontmatter `name` (or its enclosing directory). Every later upload
            # must resolve to the same value. Also the top-level directory of the Skill's
            # mounted files and the base name of a downloaded archive.
            name:,
            # Unique identifier for the skill.
            #
            # The format and length of IDs may change over time.
            skill_id:,
            # Object type.
            #
            # For Skill Versions, this is always `"skill_version"`.
            type: :skill_version
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                description: String,
                name: String,
                skill_id: String,
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end

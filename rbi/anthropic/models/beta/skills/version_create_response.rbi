# typed: strong

module Anthropic
  module Models
    module Beta
      module Skills
        class VersionCreateResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Models::Beta::Skills::VersionCreateResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for the skill version.
          #
          # The format and length of IDs may change over time.
          sig { returns(String) }
          attr_accessor :id

          # ISO 8601 timestamp of when the skill version was created.
          sig { returns(String) }
          attr_accessor :created_at

          # Description of the skill version.
          #
          # This is extracted from the SKILL.md file in the skill upload.
          sig { returns(String) }
          attr_accessor :description

          # Directory name of the skill version.
          #
          # This is the top-level directory name that was extracted from the uploaded files.
          sig { returns(String) }
          attr_accessor :directory

          # Human-readable name of the skill version.
          #
          # This is extracted from the SKILL.md file in the skill upload.
          sig { returns(String) }
          attr_accessor :name

          # Identifier for the skill that this version belongs to.
          sig { returns(String) }
          attr_accessor :skill_id

          # Object type.
          #
          # For Skill Versions, this is always `"skill_version"`.
          sig { returns(String) }
          attr_accessor :type

          # Version identifier for the skill.
          #
          # Each version is identified by a Unix epoch timestamp (e.g., "1759178010641129").
          sig { returns(String) }
          attr_accessor :version

          sig do
            params(
              id: String,
              created_at: String,
              description: String,
              directory: String,
              name: String,
              skill_id: String,
              type: String,
              version: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for the skill version.
            #
            # The format and length of IDs may change over time.
            id:,
            # ISO 8601 timestamp of when the skill version was created.
            created_at:,
            # Description of the skill version.
            #
            # This is extracted from the SKILL.md file in the skill upload.
            description:,
            # Directory name of the skill version.
            #
            # This is the top-level directory name that was extracted from the uploaded files.
            directory:,
            # Human-readable name of the skill version.
            #
            # This is extracted from the SKILL.md file in the skill upload.
            name:,
            # Identifier for the skill that this version belongs to.
            skill_id:,
            # Object type.
            #
            # For Skill Versions, this is always `"skill_version"`.
            type:,
            # Version identifier for the skill.
            #
            # Each version is identified by a Unix epoch timestamp (e.g., "1759178010641129").
            version:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: String,
                description: String,
                directory: String,
                name: String,
                skill_id: String,
                type: String,
                version: String
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

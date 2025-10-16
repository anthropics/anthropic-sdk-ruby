# typed: strong

module Anthropic
  module Models
    module Beta
      class SkillListResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Models::Beta::SkillListResponse,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        sig { returns(String) }
        attr_accessor :id

        # ISO 8601 timestamp of when the skill was created.
        sig { returns(String) }
        attr_accessor :created_at

        # Display title for the skill.
        #
        # This is a human-readable label that is not included in the prompt sent to the
        # model.
        sig { returns(T.nilable(String)) }
        attr_accessor :display_title

        # The latest version identifier for the skill.
        #
        # This represents the most recent version of the skill that has been created.
        sig { returns(T.nilable(String)) }
        attr_accessor :latest_version

        # Source of the skill.
        #
        # This may be one of the following values:
        #
        # - `"custom"`: the skill was created by a user
        # - `"anthropic"`: the skill was created by Anthropic
        sig { returns(String) }
        attr_accessor :source

        # Object type.
        #
        # For Skills, this is always `"skill"`.
        sig { returns(String) }
        attr_accessor :type

        # ISO 8601 timestamp of when the skill was last updated.
        sig { returns(String) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            created_at: String,
            display_title: T.nilable(String),
            latest_version: T.nilable(String),
            source: String,
            type: String,
            updated_at: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          id:,
          # ISO 8601 timestamp of when the skill was created.
          created_at:,
          # Display title for the skill.
          #
          # This is a human-readable label that is not included in the prompt sent to the
          # model.
          display_title:,
          # The latest version identifier for the skill.
          #
          # This represents the most recent version of the skill that has been created.
          latest_version:,
          # Source of the skill.
          #
          # This may be one of the following values:
          #
          # - `"custom"`: the skill was created by a user
          # - `"anthropic"`: the skill was created by Anthropic
          source:,
          # Object type.
          #
          # For Skills, this is always `"skill"`.
          type:,
          # ISO 8601 timestamp of when the skill was last updated.
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: String,
              display_title: T.nilable(String),
              latest_version: T.nilable(String),
              source: String,
              type: String,
              updated_at: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

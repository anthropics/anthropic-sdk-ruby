# typed: strong

module Anthropic
  module Models
    class Skill < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Anthropic::Skill, Anthropic::Internal::AnyHash) }

      # Unique identifier for the skill.
      #
      # The format and length of IDs may change over time.
      sig { returns(String) }
      attr_accessor :id

      # ISO 8601 timestamp of when the skill was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Human-readable, single-line label for the Skill. Maximum 255 characters. Always
      # set: derived from the SKILL.md frontmatter `name` when omitted at creation. Not
      # unique.
      sig { returns(String) }
      attr_accessor :display_name

      # ID of the newest Skill Version — what `latest` references resolve to. Always
      # set: a Skill holds at least one version.
      sig { returns(String) }
      attr_accessor :latest_version_id

      # Where the Skill comes from.
      #
      # Possible values:
      #
      # - `"custom"`: authored by the platform user; private to their workspace
      # - `"anthropic"`: published by Anthropic; shared and read-only
      # - `"anthropic_example"`: Anthropic-published sample Skill
      # - `"plugin"`: resolved from an installed plugin
      sig { returns(Anthropic::SkillSource) }
      attr_reader :source

      sig { params(source: Anthropic::SkillSource::OrHash).void }
      attr_writer :source

      # Object type.
      #
      # For Skills, this is always `"skill"`.
      sig { returns(Symbol) }
      attr_accessor :type

      # ISO 8601 timestamp of when the skill was last updated.
      sig { returns(Time) }
      attr_accessor :updated_at

      sig do
        params(
          id: String,
          created_at: Time,
          display_name: String,
          latest_version_id: String,
          source: Anthropic::SkillSource::OrHash,
          updated_at: Time,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        id:,
        # ISO 8601 timestamp of when the skill was created.
        created_at:,
        # Human-readable, single-line label for the Skill. Maximum 255 characters. Always
        # set: derived from the SKILL.md frontmatter `name` when omitted at creation. Not
        # unique.
        display_name:,
        # ID of the newest Skill Version — what `latest` references resolve to. Always
        # set: a Skill holds at least one version.
        latest_version_id:,
        # Where the Skill comes from.
        #
        # Possible values:
        #
        # - `"custom"`: authored by the platform user; private to their workspace
        # - `"anthropic"`: published by Anthropic; shared and read-only
        # - `"anthropic_example"`: Anthropic-published sample Skill
        # - `"plugin"`: resolved from an installed plugin
        source:,
        # ISO 8601 timestamp of when the skill was last updated.
        updated_at:,
        # Object type.
        #
        # For Skills, this is always `"skill"`.
        type: :skill
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            display_name: String,
            latest_version_id: String,
            source: Anthropic::SkillSource,
            type: Symbol,
            updated_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end

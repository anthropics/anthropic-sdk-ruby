# typed: strong

module Anthropic
  module Models
    class SkillCreateParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::SkillCreateParams, Anthropic::Internal::AnyHash)
        end

      # Files to upload for the skill.
      #
      # All files must be in the same top-level directory and must include a SKILL.md
      # file at the root of that directory.
      sig { returns(T::Array[Anthropic::Internal::FileInput]) }
      attr_accessor :files

      # Human-readable, single-line label for the Skill. Maximum 255 characters. Always
      # set: derived from the SKILL.md frontmatter `name` when omitted at creation. Not
      # unique.
      sig { returns(T.nilable(String)) }
      attr_accessor :display_name

      sig do
        params(
          files: T::Array[Anthropic::Internal::FileInput],
          display_name: T.nilable(String),
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Files to upload for the skill.
        #
        # All files must be in the same top-level directory and must include a SKILL.md
        # file at the root of that directory.
        files:,
        # Human-readable, single-line label for the Skill. Maximum 255 characters. Always
        # set: derived from the SKILL.md frontmatter `name` when omitted at creation. Not
        # unique.
        display_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            files: T::Array[Anthropic::Internal::FileInput],
            display_name: T.nilable(String),
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

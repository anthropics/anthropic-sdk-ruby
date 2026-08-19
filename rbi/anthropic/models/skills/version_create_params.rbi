# typed: strong

module Anthropic
  module Models
    module Skills
      class VersionCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Skills::VersionCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        sig { returns(String) }
        attr_accessor :skill_id

        # Files to upload for the skill.
        #
        # All files must be in the same top-level directory and must include a SKILL.md
        # file at the root of that directory.
        sig { returns(T::Array[Anthropic::Internal::FileInput]) }
        attr_accessor :files

        sig do
          params(
            skill_id: String,
            files: T::Array[Anthropic::Internal::FileInput],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id:,
          # Files to upload for the skill.
          #
          # All files must be in the same top-level directory and must include a SKILL.md
          # file at the root of that directory.
          files:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              skill_id: String,
              files: T::Array[Anthropic::Internal::FileInput],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

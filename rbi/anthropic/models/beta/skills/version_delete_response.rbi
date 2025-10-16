# typed: strong

module Anthropic
  module Models
    module Beta
      module Skills
        class VersionDeleteResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Models::Beta::Skills::VersionDeleteResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # Version identifier for the skill.
          #
          # Each version is identified by a Unix epoch timestamp (e.g., "1759178010641129").
          sig { returns(String) }
          attr_accessor :id

          # Deleted object type.
          #
          # For Skill Versions, this is always `"skill_version_deleted"`.
          sig { returns(String) }
          attr_accessor :type

          sig { params(id: String, type: String).returns(T.attached_class) }
          def self.new(
            # Version identifier for the skill.
            #
            # Each version is identified by a Unix epoch timestamp (e.g., "1759178010641129").
            id:,
            # Deleted object type.
            #
            # For Skill Versions, this is always `"skill_version_deleted"`.
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
end

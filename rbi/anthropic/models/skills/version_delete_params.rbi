# typed: strong

module Anthropic
  module Models
    module Skills
      class VersionDeleteParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Skills::VersionDeleteParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for the skill.
        #
        # The format and length of IDs may change over time.
        sig { returns(String) }
        attr_accessor :skill_id

        # Identifies the skill version by its version ID.
        #
        # Requests carrying the `skills-2025-10-02` beta header address versions by their
        # Unix epoch timestamp instead (e.g., "1759178010641129").
        sig { returns(String) }
        attr_accessor :version

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig do
          params(
            skill_id: String,
            version: String,
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the skill.
          #
          # The format and length of IDs may change over time.
          skill_id:,
          # Identifies the skill version by its version ID.
          #
          # Requests carrying the `skills-2025-10-02` beta header address versions by their
          # Unix epoch timestamp instead (e.g., "1759178010641129").
          version:,
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              skill_id: String,
              version: String,
              workspace_id: String,
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

# frozen_string_literal: true

module Anthropic
  module Models
    module Skills
      # @see Anthropic::Resources::Skills::Versions#delete
      class VersionDeleteParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute skill_id
        #   Unique identifier for the skill.
        #
        #   The format and length of IDs may change over time.
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute version
        #   Identifies the skill version by its version ID.
        #
        #   Requests carrying the `skills-2025-10-02` beta header address versions by their
        #   Unix epoch timestamp instead (e.g., "1759178010641129").
        #
        #   @return [String]
        required :version, String

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!method initialize(skill_id:, version:, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Skills::VersionDeleteParams} for more details.
        #
        #   @param skill_id [String] Unique identifier for the skill.
        #
        #   @param version [String] Identifies the skill version by its version ID.
        #
        #   @param workspace_id [String]
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

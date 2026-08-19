# frozen_string_literal: true

module Anthropic
  module Models
    module Skills
      # @see Anthropic::Resources::Skills::Versions#retrieve
      class VersionRetrieveParams < Anthropic::Internal::Type::BaseModel
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
        #   Identifies the skill version: a version ID, or — where the endpoint accepts it —
        #   the literal `latest` for the skill's most recent version.
        #
        #   Requests carrying the `skills-2025-10-02` beta header address versions by their
        #   Unix epoch timestamp instead (e.g., "1759178010641129").
        #
        #   @return [String]
        required :version, String

        # @!method initialize(skill_id:, version:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Skills::VersionRetrieveParams} for more details.
        #
        #   @param skill_id [String] Unique identifier for the skill.
        #
        #   @param version [String] Identifies the skill version: a version ID, or — where the endpoint accepts it —
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

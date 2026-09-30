# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Federation
        # @see Anthropic::Resources::Organization::Federation::Rules#archive
        class RuleArchiveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute federation_rule_id
          #   ID of the federation rule to archive.
          #
          #   @return [String]
          required :federation_rule_id, String

          # @!method initialize(federation_rule_id:, request_options: {})
          #   @param federation_rule_id [String] ID of the federation rule to archive.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end

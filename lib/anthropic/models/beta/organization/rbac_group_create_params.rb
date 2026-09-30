# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RBACGroups#create
        class RBACGroupCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute name
          #   Name of the RBAC Group. Not uniqueness-enforced.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(name:, request_options: {})
          #   @param name [String] Name of the RBAC Group. Not uniqueness-enforced.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::RBACGroups#create
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

# typed: strong

module Anthropic
  module Models
    # The endpoint serves only organizations that belong to a parent organization, and
    # this organization belongs to none.
    class ParentOrganizationRequiredError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ParentOrganizationRequiredErrorDetails) }
      def details
      end
    end
  end
end

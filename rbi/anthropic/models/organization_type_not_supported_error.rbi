# typed: strong

module Anthropic
  module Models
    # The endpoint does not support the organization's type. Each endpoint's
    # description says which organization types it supports.
    class OrganizationTypeNotSupportedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::OrganizationTypeNotSupportedErrorDetails) }
      def details
      end
    end
  end
end

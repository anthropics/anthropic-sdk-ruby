# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActorAWSProvider < Anthropic::Internal::Type::BaseModel
          # @!attribute account_id
          #   The AWS account the organization is bound to.
          #
          #   @return [String]
          required :account_id, String

          # @!attribute signed_principal
          #   The AWS-signed ARN of the IAM principal that made the requests.
          #
          #   @return [String]
          required :signed_principal, String

          # @!attribute type
          #
          #   @return [Symbol, :aws]
          required :type, const: :aws

          # @!method initialize(account_id:, signed_principal:, type: :aws)
          #   @param account_id [String] The AWS account the organization is bound to.
          #
          #   @param signed_principal [String] The AWS-signed ARN of the IAM principal that made the requests.
          #
          #   @param type [Symbol, :aws]
        end
      end
    end
  end
end

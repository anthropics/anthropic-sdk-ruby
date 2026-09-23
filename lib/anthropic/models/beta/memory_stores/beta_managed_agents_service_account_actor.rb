# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsServiceAccountActor < Anthropic::Internal::Type::BaseModel
          # @!attribute service_account_id
          #   ID of the service account (a `svac_...` value).
          #
          #   @return [String]
          required :service_account_id, String

          # @!attribute type
          #
          #   @return [Symbol, :service_account_actor]
          required :type, const: :service_account_actor

          # @!method initialize(service_account_id:, type: :service_account_actor)
          #   A workload authenticated as a service account, for example via Workload Identity
          #   Federation.
          #
          #   @param service_account_id [String] ID of the service account (a `svac_...` value).
          #
          #   @param type [Symbol, :service_account_actor]
        end
      end
    end
  end
end

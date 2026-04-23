# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        module BetaManagedAgentsActor
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :session_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor }

          variant :api_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor }

          variant :user_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor)]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMetadata < Anthropic::Internal::Type::BaseModel
        # @!attribute user_id
        #   An external identifier for the user who is associated with the request.
        #
        #   This should be a uuid, hash value, or other opaque identifier. Anthropic may use
        #   this id to help detect abuse. Do not include any identifying information such as
        #   name, email address, or phone number.
        #
        #   @return [String, nil]
        optional :user_id, String, nil?: true

        # @!method initialize(user_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaMetadata} for more details.
        #
        #   @param user_id [String, nil] An external identifier for the user who is associated with the request.
      end
    end

    BetaMetadata = Beta::BetaMetadata
  end
end

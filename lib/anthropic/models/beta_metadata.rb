# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMetadata < BaseModel
      # @!attribute [rw] user_id
      #   An external identifier for the user who is associated with the request.
      #
      # This should be a uuid, hash value, or other opaque identifier. Anthropic may use this id to help detect abuse. Do not include any identifying information such as name, email address, or phone number.
      #   @return [String]
      optional :user_id, String

      # Create a new instance of BetaMetadata from a Hash of raw data.
      #
      # @overload initialize(user_id: nil)
      # @param user_id [String] An external identifier for the user who is associated with the request.
      #
      #   This should be a uuid, hash value, or other opaque identifier. Anthropic may use
      #   this id to help detect abuse. Do not include any identifying information such as
      #   name, email address, or phone number.
      def initialize(data = {})
        super
      end
    end
  end
end

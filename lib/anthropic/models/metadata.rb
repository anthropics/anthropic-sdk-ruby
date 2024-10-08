# frozen_string_literal: true

module Anthropic
  module Models
    class Metadata < BaseModel
      # @!attribute [rw] user_id
      #   An external identifier for the user who is associated with the request.
      #
      # This should be a uuid, hash value, or other opaque identifier. Anthropic may use this id to help detect abuse. Do not include any identifying information such as name, email address, or phone number.
      #   @return [String]
      optional :user_id, String
    end
  end
end

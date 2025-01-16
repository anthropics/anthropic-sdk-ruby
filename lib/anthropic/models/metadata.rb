# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # metadata => {
    #   user_id: String
    # }
    # ```
    class Metadata < Anthropic::BaseModel
      # @!attribute user_id
      #   An external identifier for the user who is associated with the request.
      #
      # This should be a uuid, hash value, or other opaque identifier. Anthropic may use this id to help detect abuse. Do not include any identifying information such as name, email address, or phone number.
      #
      #   @return [String, nil]
      optional :user_id, String

      # @!parse
      #   # @param user_id [String, nil] An external identifier for the user who is associated with the request.
      #   #
      #   #   This should be a uuid, hash value, or other opaque identifier. Anthropic may use
      #   #   this id to help detect abuse. Do not include any identifying information such as
      #   #   name, email address, or phone number.
      #   #
      #   def initialize(user_id: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end

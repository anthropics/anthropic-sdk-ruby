# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        # @see Anthropic::Resources::Beta::UserProfiles::ActionURLs#create
        class BetaUserProfileActionURL < Anthropic::Internal::Type::BaseModel
          # @!attribute expires_at
          #   When the URL stops working, in RFC 3339 format.
          #
          #   @return [Time]
          required :expires_at, Time

          # @!attribute type
          #   Object type. Always `user_profile_action_url`.
          #
          #   @return [Symbol, :user_profile_action_url]
          required :type, const: :user_profile_action_url

          # @!attribute url
          #   The URL to give to the person who takes the action. Anyone who holds it can open
          #   it until `expires_at`.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(expires_at:, url:, type: :user_profile_action_url)
          #   A URL to give to the person who takes the requested action.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::UserProfiles::BetaUserProfileActionURL} for more
          #   details.
          #
          #   @param expires_at [Time] When the URL stops working, in RFC 3339 format.
          #
          #   @param url [String] The URL to give to the person who takes the action. Anyone who holds it can open
          #
          #   @param type [Symbol, :user_profile_action_url] Object type. Always `user_profile_action_url`.
        end
      end
    end
  end
end

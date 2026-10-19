# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        # @see Anthropic::Resources::Beta::UserProfiles::ActionURLs#create
        class ActionURLCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute user_profile_id
          #   The ID of the user profile the action is for (`uprof_...`).
          #
          #   @return [String]
          required :user_profile_id, String

          # @!attribute action
          #   The action that the person who opens the URL takes.
          #
          #   @return [Anthropic::Models::Beta::UserProfiles::BetaUserProfileEnrollEndUserAction]
          required :action, -> { Anthropic::Beta::UserProfiles::BetaUserProfileEnrollEndUserAction }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!attribute workspace_id
          #   Optional header to select the Workspace for this request. The value is a
          #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          #   Only needed for credentials that can act on more than one Workspace. A
          #   credential that belongs to a specific Workspace may omit it; if sent, it must
          #   match that Workspace.
          #
          #   @return [String, nil]
          optional :workspace_id, String

          # @!method initialize(user_profile_id:, action:, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::UserProfiles::ActionURLCreateParams} for more details.
          #
          #   @param user_profile_id [String] The ID of the user profile the action is for (`uprof_...`).
          #
          #   @param action [Anthropic::Models::Beta::UserProfiles::BetaUserProfileEnrollEndUserAction] The action that the person who opens the URL takes.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end

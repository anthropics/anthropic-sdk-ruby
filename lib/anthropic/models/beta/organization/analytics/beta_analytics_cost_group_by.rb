# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          module BetaAnalyticsCostGroupBy
            extend Anthropic::Internal::Type::Enum

            ACTOR = :actor
            ACTOR_TYPE = :actor_type
            AGENT_ID = :agent_id
            API_KEY_ID = :api_key_id
            CLAUDE_TAG_CATEGORY = :claude_tag_category
            CLAUDE_TAG_USER_ID = :claude_tag_user_id
            CONTEXT_WINDOW = :context_window
            COST_TYPE = :cost_type
            DEPLOYMENT_ID = :deployment_id
            ENVIRONMENT_ID = :environment_id
            INFERENCE_GEO = :inference_geo
            MODEL = :model
            PRODUCT = :product
            RBAC_GROUP_ID = :rbac_group_id
            SERVICE_TIER = :service_tier
            SESSION_ID = :session_id
            SLACK_CHANNEL_ID = :slack_channel_id
            SPEED = :speed
            TOKEN_TYPE = :token_type
            USER_PROFILE_ID = :user_profile_id
            WORKSPACE_ID = :workspace_id

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end

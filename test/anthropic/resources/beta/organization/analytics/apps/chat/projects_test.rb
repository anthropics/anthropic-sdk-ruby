# frozen_string_literal: true

require_relative "../../../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::Apps::Chat::ProjectsTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.organization.analytics.apps.chat.projects.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsProjectActivity
    end

    assert_pattern do
      row => {
        distinct_user_count: Integer,
        message_count: Integer,
        project_id: String,
        project_name: String,
        created_at: Time | nil,
        created_by: Anthropic::Beta::Organization::BetaAnalyticsUser | nil,
        distinct_conversation_count: Integer | nil,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        user_id: String | nil
      }
    end
  end
end

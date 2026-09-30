# frozen_string_literal: true

require_relative "../../../../test_helper"

class Anthropic::Test::Resources::Beta::Organization::Analytics::ArtifactsTest < Anthropic::Test::ResourceTest
  def test_list_required_params
    response = @anthropic.beta.organization.analytics.artifacts.list(date: "2019-12-27")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Organization::BetaAnalyticsArtifactActivity
    end

    assert_pattern do
      row => {
        artifact_type: String,
        artifacts_created_count: Integer,
        distinct_user_count: Integer,
        is_shared: Anthropic::Internal::Type::Boolean,
        published_artifacts_created_count: Integer,
        product: String | nil,
        rbac_group_id: String | nil,
        rbac_group_name: String | nil,
        user_id: String | nil
      }
    end
  end
end

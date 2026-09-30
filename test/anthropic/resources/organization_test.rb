# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::OrganizationTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.organization.retrieve

    assert_pattern do
      response => Anthropic::OrganizationInfo
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        type: Symbol
      }
    end
  end
end

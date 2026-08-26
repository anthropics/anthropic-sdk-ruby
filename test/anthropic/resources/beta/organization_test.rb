# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::OrganizationTest < Anthropic::Test::ResourceTest
  def test_retrieve
    response = @anthropic.beta.organization.retrieve

    assert_pattern do
      response => Anthropic::Beta::BetaOrganization
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

# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::VertexClientTest < Minitest::Test
  def test_fit_req_to_vertex_specs
    model = "claude-3-5-haiku@20241022"
    request_components =
      {
        method: :post,
        path: "v1/messages",
        body: {
          max_tokens: 1024,
          messages: [{role: "user", content: "Hello, Claude"}],
          model: model
        },
        model: Anthropic::Models::Message,
        options: nil
      }

    project = "stock-data-1111111"
    region = "us-east5"
    client = Anthropic::VertexClient.new(region: region, project_id: project)
    request_components = client.send(:fit_req_to_vertex_specs!, request_components)

    assert_equal(
      {
        method: :post,
        path: "projects/#{project}/locations/#{region}/publishers/anthropic/models/#{model}:rawPredict",
        body: {
          anthropic_version: Anthropic::VertexClient::DEFAULT_VERSION,
          max_tokens: 1024,
          messages: [{role: "user", content: "Hello, Claude"}]
        },
        model: Anthropic::Models::Message,
        options: nil
      },
      request_components
    )
  end

  def test_fit_req_to_vertex_specs_for_beta
    model = "claude-3-5-sonnet-v2@20241022"
    tools = [
      {
        type: "computer_20241022",
        name: "computer",
        display_width_px: 1024,
        display_height_px: 768,
        display_number: 1
      },
      {
        type: "text_editor_20241022",
        name: "str_replace_editor"
      },
      {
        type: "bash_20241022",
        name: "bash"
      }
    ]
    request_components =
      {
        method: :post,
        path: "v1/messages?beta=true",
        body: {
          max_tokens: 1024,
          messages: [{role: "user", content: "Save a picture of a cat to my desktop."}],
          model: model,
          tools: tools,
          "anthropic-beta": ["computer-use-2025-01-24"]
        },
        model: Anthropic::Models::Message,
        options: nil
      }

    project = "stock-data-1111111"
    region = "us-east5"
    client = Anthropic::VertexClient.new(region: region, project_id: project)
    request_components = client.send(:fit_req_to_vertex_specs!, request_components)

    assert_equal(
      {
        method: :post,
        path: "projects/#{project}/locations/#{region}/publishers/anthropic/models/#{model}:rawPredict",
        body: {
          anthropic_version: Anthropic::VertexClient::DEFAULT_VERSION,
          max_tokens: 1024,
          messages: [{role: "user", content: "Save a picture of a cat to my desktop."}],
          tools: tools
        },
        model: Anthropic::Models::Message,
        options: nil,
        headers: {"anthropic-beta" => "computer-use-2025-01-24"}
      },
      request_components
    )
  end
end

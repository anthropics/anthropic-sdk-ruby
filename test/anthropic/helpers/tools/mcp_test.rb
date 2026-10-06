# frozen_string_literal: true

require_relative "../../test_helper"

begin
  require("mcp")
rescue LoadError
  # Skip the entire suite if the optional `mcp` gem isn't installed.
  warn("[mcp_test] skipping: `mcp` gem not installed")
  return
end

class Anthropic::Test::Helpers::Tools::McpTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  # ---------------------------------------------------------------------------
  # Fake MCP client — captures `call_tool` invocations and returns canned
  # responses. Mirrors the surface area the helpers exercise so we don't depend
  # on a live MCP transport.
  # ---------------------------------------------------------------------------
  class FakeMcpClient
    attr_reader :calls

    def initialize(responses: {})
      @responses = responses
      @calls = []
    end

    def call_tool(name:, arguments:, **_opts)
      @calls << {name: name, arguments: arguments}
      response = @responses[name]
      response.respond_to?(:call) ? response.call(arguments) : response
    end
  end

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
  end

  def teardown
    WebMock.reset!
    super
  end

  # -- content() --------------------------------------------------------------

  def test_content_text_block
    block = Anthropic::Mcp.content({"type" => "text", "text" => "hello"})
    assert_equal({type: :text, text: "hello"}, block)
  end

  def test_content_supports_cache_control
    block = Anthropic::Mcp.content(
      {"type" => "text", "text" => "hi"},
      cache_control: {type: "ephemeral"}
    )
    assert_equal({type: "ephemeral"}, block[:cache_control])
  end

  def test_content_accepts_typed_mcp_content
    typed = MCP::Content::Text.new("hi")
    assert_equal({type: :text, text: "hi"}, Anthropic::Mcp.content(typed))
  end

  def test_content_image_block
    block = Anthropic::Mcp.content(
      {"type" => "image", "data" => "AAAA", "mimeType" => "image/png"}
    )
    assert_equal(
      {type: :image, source: {type: :base64, data: "AAAA", media_type: "image/png"}},
      block
    )
  end

  def test_content_image_rejects_unsupported_mime
    assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
      Anthropic::Mcp.content({"type" => "image", "data" => "x", "mimeType" => "image/bmp"})
    end
  end

  def test_content_audio_unsupported
    assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
      Anthropic::Mcp.content({"type" => "audio", "data" => "x", "mimeType" => "audio/wav"})
    end
  end

  def test_content_resource_link_unsupported
    assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
      Anthropic::Mcp.content(
        {"type" => "resource_link", "uri" => "file:///x.txt", "name" => "x"}
      )
    end
  end

  def test_content_embedded_text_resource
    block = Anthropic::Mcp.content(
      {
        "type" => "resource",
        "resource" => {"uri" => "file:///note.txt", "mimeType" => "text/plain", "text" => "hi"}
      }
    )
    assert_equal(
      {type: :document, source: {type: :text, data: "hi", media_type: "text/plain"}},
      block
    )
  end

  # -- message() --------------------------------------------------------------

  def test_message_wraps_content
    msg = Anthropic::Mcp.message(
      {"role" => "user", "content" => {"type" => "text", "text" => "hi"}}
    )
    assert_equal(
      {role: :user, content: [{type: :text, text: "hi"}]},
      msg
    )
  end

  # -- resource_to_contents() -------------------------------------------------

  def test_resource_to_contents_converts_all_items
    blocks = Anthropic::Mcp.resource_to_contents(
      [
        {"uri" => "x://1", "mimeType" => "text/plain", "text" => "first"},
        {"uri" => "x://2", "mimeType" => "text/plain", "text" => "second"}
      ]
    )
    assert_equal(
      [
        {type: :document, source: {type: :text, data: "first", media_type: "text/plain"}},
        {type: :document, source: {type: :text, data: "second", media_type: "text/plain"}}
      ],
      blocks
    )
  end

  def test_resource_to_contents_pdf
    blocks = Anthropic::Mcp.resource_to_contents(
      {contents: [{"uri" => "x://doc", "mimeType" => "application/pdf", "blob" => "AAAA"}]}
    )
    assert_equal(
      [{type: :document, source: {type: :base64, data: "AAAA", media_type: "application/pdf"}}],
      blocks
    )
  end

  def test_resource_to_contents_pdf_rejects_text
    err = assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
      Anthropic::Mcp.resource_to_contents(
        [{"uri" => "x://doc", "mimeType" => "application/pdf", "text" => "no"}]
      )
    end
    assert_match(/PDF resource must have blob/, err.message)
  end

  def test_resource_to_contents_image_resource
    blocks = Anthropic::Mcp.resource_to_contents(
      [{"uri" => "x://img", "mimeType" => "image/png", "blob" => "AAAA"}]
    )
    assert_equal(
      [{type: :image, source: {type: :base64, data: "AAAA", media_type: "image/png"}}],
      blocks
    )
  end

  def test_resource_to_contents_empty_raises
    assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
      Anthropic::Mcp.resource_to_contents([])
    end
  end

  def test_resource_to_contents_raises_on_any_unsupported_mime
    err = assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
      Anthropic::Mcp.resource_to_contents(
        [
          {"uri" => "x://ok", "mimeType" => "text/plain", "text" => "ok"},
          {"uri" => "x://bad", "mimeType" => "application/octet-stream"}
        ]
      )
    end
    assert_match(/Unsupported MIME type/, err.message)
  end

  # -- resource_to_files() ----------------------------------------------------

  def test_resource_to_files_text
    files = Anthropic::Mcp.resource_to_files(
      [{"uri" => "file:///path/to/note.txt", "mimeType" => "text/plain", "text" => "hello"}]
    )
    assert_equal(1, files.size)
    file = files.first
    assert_instance_of(Anthropic::FilePart, file)
    assert_equal("note.txt", file.filename)
    assert_equal("text/plain", file.content_type)
    assert_equal("hello", file.content.string)
  end

  def test_resource_to_files_multiple_items
    files = Anthropic::Mcp.resource_to_files(
      [
        {"uri" => "file:///a.txt", "mimeType" => "text/plain", "text" => "A"},
        {"uri" => "file:///b.pdf", "mimeType" => "application/pdf", "blob" => Base64.strict_encode64("B")}
      ]
    )
    assert_equal(["a.txt", "b.pdf"], files.map(&:filename))
    assert_equal(["text/plain", "application/pdf"], files.map(&:content_type))
    assert_equal(%w[A B], files.map { _1.content.string })
  end

  def test_resource_to_files_empty_raises
    assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
      Anthropic::Mcp.resource_to_files([])
    end
  end

  # -- tool() : metadata + schema --------------------------------------------

  def test_tool_carries_name_description_and_schema
    schema = {
      "type" => "object",
      "properties" => {"city" => {"type" => "string"}},
      "required" => ["city"]
    }
    mcp_tool = MCP::Client::Tool.new(name: "weather", description: "Get weather", input_schema: schema)
    tool = Anthropic::Mcp.tool(mcp_tool, FakeMcpClient.new)

    assert_kind_of(Anthropic::Helpers::Tools::BaseTool, tool)
    assert_equal("weather", tool.class.tool_name)
    assert_equal("Get weather", tool.class.doc_string)
    assert_match(/\A#<weather\[#<Class:0x\h+>\]:0x\h+>\z/, tool.inspect)
    converted = Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema(tool)
    assert_equal(
      {type: "object", properties: {city: {type: "string"}}, required: ["city"]},
      converted
    )
  end

  def test_tool_normalizes_missing_properties_and_required
    mcp_tool = MCP::Client::Tool.new(name: "noop", description: nil, input_schema: {"type" => "object"})
    tool = Anthropic::Mcp.tool(mcp_tool, FakeMcpClient.new)
    schema = Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema(tool)
    assert_nil(schema[:properties])
    assert_nil(schema[:required])
  end

  def test_tool_options_flow_into_definition
    mcp_tool = MCP::Client::Tool.new(name: "t", description: nil, input_schema: {"type" => "object"})
    tool = Anthropic::Mcp.tool(
      mcp_tool,
      FakeMcpClient.new,
      cache_control: {type: "ephemeral"},
      defer_loading: true,
      strict: true
    )
    assert_equal(
      {cache_control: {type: "ephemeral"}, defer_loading: true, strict: true},
      tool.class.tool_options
    )

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "test-key")
    captured_request_body = nil
    stub_anthropic_with_capture(
      ->(req) { captured_request_body ||= JSON.parse(req.body) },
      text_response(id: "msg_1", text: "Done")
    )
    anthropic.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{role: :user, content: "go"}],
      model: :"claude-sonnet-4-5",
      tools: [tool]
    ).each_message { _1 }

    assert_equal(
      [
        {
          "name" => "t",
          "input_schema" => {"type" => "object", "properties" => nil, "required" => nil},
          "cache_control" => {"type" => "ephemeral"},
          "defer_loading" => true,
          "strict" => true
        }
      ],
      captured_request_body["tools"]
    )
  end

  # -- tool() : runner integration -------------------------------------------

  def test_runner_dispatches_mcp_tool_call
    schema = {"type" => "object", "properties" => {"city" => {"type" => "string"}}, "required" => ["city"]}
    mcp_tool = MCP::Client::Tool.new(name: "weather", description: "Get weather", input_schema: schema)

    fake_mcp = FakeMcpClient.new(
      responses: {"weather" => {"result" => {"content" => [{"type" => "text", "text" => "sunny"}]}}}
    )

    tool = Anthropic::Mcp.tool(mcp_tool, fake_mcp)
    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "test-key")

    stub_anthropic(
      tool_use_response(id: "msg_1", tool_use: {id: "t_1", name: "weather", input: {"city" => "SF"}}),
      text_response(id: "msg_2", text: "Done")
    )

    messages = []
    anthropic.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{role: :user, content: "weather"}],
      model: :"claude-sonnet-4-5",
      tools: [tool]
    ).each_message { messages << _1 }

    assert_equal([{name: "weather", arguments: {city: "SF"}}], fake_mcp.calls)
    assert_pattern do
      messages => [
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [{text: "Done"}]}
      ]
    end
  end

  def test_runner_disambiguates_multiple_mcp_tools
    tool_a_schema = {"type" => "object", "properties" => {"q" => {"type" => "string"}}, "required" => ["q"]}
    tool_b_schema = {"type" => "object", "properties" => {"x" => {"type" => "string"}}, "required" => ["x"]}
    tool_a = MCP::Client::Tool.new(name: "alpha", description: "A", input_schema: tool_a_schema)
    tool_b = MCP::Client::Tool.new(name: "beta", description: "B", input_schema: tool_b_schema)

    fake_mcp = FakeMcpClient.new(
      responses: {
        "alpha" => {"result" => {"content" => [{"type" => "text", "text" => "A-ok"}]}},
        "beta" => {"result" => {"content" => [{"type" => "text", "text" => "B-ok"}]}}
      }
    )

    a = Anthropic::Mcp.tool(tool_a, fake_mcp)
    b = Anthropic::Mcp.tool(tool_b, fake_mcp)
    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "test-key")

    stub_anthropic(
      tool_use_response(id: "m1", tool_use: {id: "t1", name: "beta", input: {"x" => "v"}}),
      text_response(id: "m2", text: "done")
    )

    anthropic.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{role: :user, content: "go"}],
      model: :"claude-sonnet-4-5",
      tools: [a, b]
    ).each_message { _1 }

    assert_equal([{name: "beta", arguments: {x: "v"}}], fake_mcp.calls)
  end

  def test_runner_handles_mcp_tool_error_result
    schema = {"type" => "object", "properties" => {}, "required" => []}
    mcp_tool = MCP::Client::Tool.new(name: "boom", description: nil, input_schema: schema)

    fake_mcp = FakeMcpClient.new(
      responses: {
        "boom" => {
          "result" => {"isError" => true, "content" => [{"type" => "text", "text" => "kaboom"}]}
        }
      }
    )

    tool = Anthropic::Mcp.tool(mcp_tool, fake_mcp)
    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "test-key")

    captured_request_body = nil
    stub_anthropic_with_capture(
      ->(req) { captured_request_body = JSON.parse(req.body) },
      tool_use_response(id: "m1", tool_use: {id: "t1", name: "boom", input: {}}),
      text_response(id: "m2", text: "ok")
    )

    anthropic.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{role: :user, content: "boom"}],
      model: :"claude-sonnet-4-5",
      tools: [tool]
    ).each_message { _1 }

    # The second request should contain the tool_result with is_error: true and "kaboom" message.
    tool_result_msg = captured_request_body["messages"].find do |m|
      m["role"] == "user" && m["content"].is_a?(Array) && m["content"].any? { _1["type"] == "tool_result" }
    end
    tool_result = tool_result_msg["content"].find { _1["type"] == "tool_result" }
    assert_equal(true, tool_result["is_error"])
    assert_equal("kaboom", tool_result["content"])
  end

  def test_structured_content_fallback
    result = Anthropic::Helpers::Tools::Mcp.send(
      :convert_tool_result,
      {"result" => {"content" => [], "structuredContent" => {"answer" => 42}}}
    )
    assert_equal('{"answer":42}', result)
  end

  def test_image_media_type_variants_preserve_data_and_cache_control
    %w[image/jpeg image/png image/gif image/webp].each do |expected|
      [
        expected,
        expected.upcase,
        "#{expected}; charset=binary",
        " #{expected.upcase} ; profile=\"A;B\" "
      ].each do |mime|
        input = {"type" => "image", "data" => "AQID", "mimeType" => mime.freeze}.freeze
        block = Anthropic::Mcp.content(input, cache_control: {type: "ephemeral"})
        assert_equal(
          {
            type: :image,
            source: {type: :base64, data: "AQID", media_type: expected},
            cache_control: {type: "ephemeral"}
          },
          block
        )
        assert_equal(mime, input["mimeType"])
        message = Anthropic::Mcp.message({role: :user, content: input})
        assert_equal(expected, message[:content][0][:source][:media_type])
      end
    end
  end

  def test_resource_media_type_variants_preserve_all_resources_and_file_metadata
    resources = [
      {uri: "file:///image.png", mimeType: ' IMAGE/PNG ; profile="A;B" ', blob: "AQID"},
      {uri: "file:///doc.pdf", mimeType: "Application/PDF; version=1.7", blob: "AQID"},
      {uri: "file:///note.txt", mimeType: "TEXT/PLAIN; charset=utf-8", text: "héllo"}
    ]
    original = Marshal.load(Marshal.dump(resources))
    blocks = Anthropic::Mcp.resource_to_contents(resources, cache_control: {type: "ephemeral"})
    assert_equal([:image, :document, :document], blocks.map { _1[:type] })
    assert_equal(%w[image/png application/pdf text/plain], blocks.map { _1[:source][:media_type] })
    assert_equal(%w[AQID AQID héllo], blocks.map { _1[:source][:data] })
    assert_equal([{type: "ephemeral"}] * 3, blocks.map { _1[:cache_control] })
    resources.each_with_index do |resource, i|
      embedded = Anthropic::Mcp.content({type: "resource", resource: resource})
      assert_equal(blocks[i][:source], embedded[:source])
    end
    files = Anthropic::Mcp.resource_to_files(resources)
    assert_equal(resources.map { _1[:mimeType] }, files.map(&:content_type))
    assert_equal(["\x01\x02\x03", "\x01\x02\x03", "héllo"], files.map { _1.content.string })
    assert_equal(original, resources)
  end

  def test_normalized_media_types_keep_unsupported_and_missing_blob_checks
    ["IMAGE/BMP; version=1", "application/octet-stream", "", "; charset=utf-8"].each do |mime|
      assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
        Anthropic::Mcp.content({type: "image", data: "AQID", mimeType: mime})
      end
      assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
        Anthropic::Mcp.resource_to_contents([{uri: "file:///x", mimeType: mime, blob: "AQID"}])
      end
    end
    ["IMAGE/PNG; version=1", "APPLICATION/PDF; version=1"].each do |mime|
      error = assert_raises(Anthropic::Mcp::UnsupportedMCPValueError) do
        Anthropic::Mcp.resource_to_contents([{uri: "file:///x", mimeType: mime, text: "not a blob"}])
      end
      assert_match(/must have blob data/, error.message)
    end
    blocks = Anthropic::Mcp.resource_to_contents([{uri: "file:///x", text: "default"}])
    assert_equal("default", blocks[0][:source][:data])
  end

  def test_runner_returns_normalized_mcp_image_results
    fake = FakeMcpClient.new(
      responses: {
        "image" => {
          "result" => {
            "content" => [
              {
                "type" => "image",
                "data" => "AQID",
                "mimeType" => "IMAGE/PNG; profile=srgb"
              }
            ]
          }
        }
      }
    )
    definition = MCP::Client::Tool.new(name: "image", description: nil, input_schema: {"type" => "object"})
    tool = Anthropic::Mcp.tool(definition, fake)
    client = Anthropic::Client.new(base_url: "http://localhost", api_key: "test-key")
    bodies = []
    stub_anthropic_with_capture(
      ->(req) { bodies << JSON.parse(req.body) },
      tool_use_response(id: "m1", tool_use: {id: "t1", name: "image", input: {}}),
      text_response(id: "m2", text: "done")
    )
    client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{role: :user, content: "get image"}],
      model: :"claude-sonnet-4-5",
      tools: [tool]
    ).each_message { _1 }
    result = bodies.last["messages"].last["content"].first
    assert_equal("t1", result["tool_use_id"])
    refute(result["is_error"])
    assert_equal(
      [{"type" => "image", "source" => {"type" => "base64", "data" => "AQID", "media_type" => "image/png"}}],
      result["content"]
    )
    assert_equal([{name: "image", arguments: {}}], fake.calls)
  end

  # -- helpers ---------------------------------------------------------------

  def stub_anthropic(*responses)
    call_count = 0
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .to_return do |_req|
        call_count += 1
        responses[call_count - 1]
      end
  end

  def stub_anthropic_with_capture(capture, *responses)
    call_count = 0
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .to_return do |req|
        capture.call(req)
        call_count += 1
        responses[call_count - 1]
      end
  end

  def tool_use_response(id:, tool_use:)
    {
      status: 200,
      headers: {"Content-Type" => "application/json"},
      body: {
        id: id,
        type: "message",
        role: "assistant",
        model: "claude-sonnet-4-5",
        content: [{type: "tool_use", **tool_use}],
        stop_reason: "tool_use",
        usage: {input_tokens: 1, output_tokens: 1}
      }.to_json
    }
  end

  def text_response(id:, text:)
    {
      status: 200,
      headers: {"Content-Type" => "application/json"},
      body: {
        id: id,
        type: "message",
        role: "assistant",
        model: "claude-sonnet-4-5",
        content: [{type: "text", text: text}],
        stop_reason: "end_turn",
        usage: {input_tokens: 1, output_tokens: 1}
      }.to_json
    }
  end
end

# frozen_string_literal: true

require_relative "support"

# The tests stop reading streams early on purpose.
# rubocop:disable Lint/EmptyBlock, Lint/UnreachableLoop
class Anthropic::Test::OpenTelemetryContentTest < Anthropic::Test::OpenTelemetryTestCase
  def test_the_content_mode_adds_the_messages_of_a_call
    stub_messages
    content_client.messages.create(**PARAMS, system_: "Be brief.", messages: CONVERSATION)

    span = only_span
    assert_equal(
      [{"type" => "text", "content" => "Be brief."}],
      json_attribute(span, "gen_ai.system_instructions")
    )
    assert_equal(
      [
        {"role" => "user", "parts" => [{"type" => "text", "content" => "What's the weather?"}]},
        {
          "role" => "assistant",
          "parts" => [
            {"type" => "text", "content" => "I'll check."},
            {
              "type" => "tool_call",
              "id" => "toolu_1",
              "name" => "get_weather",
              "arguments" => {"city" => "Paris"}
            }
          ]
        },
        {
          "role" => "user",
          "parts" => [
            {
              "type" => "tool_call_response",
              "id" => "toolu_1",
              "response" => [{"type" => "text", "text" => "sunny"}]
            },
            {"type" => "anthropic_image"}
          ]
        }
      ],
      json_attribute(span, "gen_ai.input.messages")
    )
    assert_equal(
      [{"role" => "assistant", "parts" => [{"type" => "text", "content" => "Hi"}]}],
      json_attribute(span, "gen_ai.output.messages")
    )
  end

  def test_string_keyed_content_blocks_are_recorded_as_symbol_keyed_ones_are
    system = [{type: :text, text: "Be brief."}]
    stub_messages
    content_client.messages.create(**PARAMS, system_: system, messages: CONVERSATION)
    names = %w[gen_ai.system_instructions gen_ai.input.messages]
    expected = only_span.attributes.slice(*names)
    @exporter.reset

    system = JSON.parse(system.to_json)
    messages = JSON.parse(CONVERSATION.to_json)
    # Symbol keys outside, string keys inside, and a model among the blocks.
    messages[1] = {
      role: :assistant,
      content: [Anthropic::TextBlockParam.new(text: "I'll check."), messages[1]["content"].last]
    }
    given = [system, messages].inspect
    stub_messages
    content_client.messages.create(**PARAMS, system_: system, messages: messages)

    assert_equal(expected, only_span.attributes.slice(*names))
    assert_equal(given, [system, messages].inspect)
    assert_requested(:post, MESSAGES_URL, times: 2) do |request|
      JSON.parse(request.body)["messages"].last["content"].first ==
        {"type" => "tool_result", "tool_use_id" => "toolu_1", "content" => "sunny"}
    end
  end

  def test_a_string_keyed_tool_result_keeps_its_content_blocks
    image = {"type" => "image", "source" => {"type" => "url", "url" => ""}}
    [{"type" => "text", "text" => "sunny"}, StringKeyedHash.from(type: "text", text: "sunny")].each do |text|
      assert_equal(
        [{type: "text", text: "sunny"}, {type: "image"}],
        Anthropic::Helpers::Tracing.tool_result_content([text, image])
      )
    end
  end

  def test_the_metadata_only_mode_is_the_default
    stub_messages
    client.messages.create(**PARAMS, system_: "Be brief.")

    attributes = only_span.attributes.keys
    assert_empty(attributes & %w[gen_ai.system_instructions gen_ai.input.messages gen_ai.output.messages])
  end

  THINKING_TURN = [
    {role: :user, content: "Think"},
    {
      role: :assistant,
      content: [
        {type: :thinking, thinking: "Let me think.", signature: "sig_1"},
        {type: :thinking, thinking: "", signature: "sig_2"},
        {type: :redacted_thinking, data: "opaque"}
      ]
    }
  ].freeze

  def test_a_thinking_block_is_a_reasoning_part_with_its_text_and_without_its_signature
    thought = {type: "thinking", thinking: "Hm.", signature: "sig_3"}
    stub_messages({status: 200, body: MESSAGE.merge(content: [thought, *MESSAGE[:content]]).to_json})
    content_client.messages.create(**PARAMS, messages: THINKING_TURN)

    span = only_span
    assert_equal(
      [
        {"type" => "reasoning", "content" => "Let me think."},
        # A hidden thinking block has no text, and its part stays.
        {"type" => "reasoning", "content" => ""},
        {"type" => "anthropic_redacted_thinking"}
      ],
      json_attribute(span, "gen_ai.input.messages").last["parts"]
    )
    assert_equal(
      [{"type" => "reasoning", "content" => "Hm."}, {"type" => "text", "content" => "Hi"}],
      json_attribute(span, "gen_ai.output.messages").first["parts"]
    )
    exported = span.attributes.to_h.to_json
    refute_match(/sig|opaque/, exported)
  end

  def test_the_metadata_only_mode_has_no_thinking
    thought = {type: "thinking", thinking: "Hm.", signature: "sig_3"}
    stub_messages({status: 200, body: MESSAGE.merge(content: [thought, *MESSAGE[:content]]).to_json})
    client.messages.create(**PARAMS, messages: THINKING_TURN)

    refute_match(/Let me think|Hm\./, only_span.attributes.to_h.to_json)
  end

  def test_a_streamed_thinking_block_is_a_reasoning_part_with_the_text_the_stream_helper_accumulated
    stub_messages(
      stream_response(
        [
          STREAM_EVENTS[0],
          {
            type: "content_block_start",
            index: 0,
            content_block: {type: "thinking", thinking: "", signature: ""}
          },
          {type: "content_block_delta", index: 0, delta: {type: "thinking_delta", thinking: "Let me "}},
          {type: "content_block_delta", index: 0, delta: {type: "thinking_delta", thinking: "think."}},
          {type: "content_block_delta", index: 0, delta: {type: "signature_delta", signature: "sig_1"}},
          {type: "content_block_stop", index: 0},
          *STREAM_EVENTS[4..]
        ]
      )
    )
    content_client.messages.stream(**PARAMS).until_done

    span = only_span
    assert_equal(
      [{"role" => "assistant", "parts" => [{"type" => "reasoning", "content" => "Let me think."}]}],
      json_attribute(span, "gen_ai.output.messages")
    )
    refute_match(/sig/, span.attributes.to_h.to_json)
  end

  def test_a_block_with_no_part_of_its_own_is_a_part_with_only_its_prefixed_type
    redacted = {type: "redacted_thinking", data: "opaque"}
    stub_messages({status: 200, body: MESSAGE.merge(content: [redacted, *MESSAGE[:content]]).to_json})
    content_client.messages.create(
      **PARAMS,
      messages: [
        {
          role: :user,
          content: [
            {type: :image, source: {type: :url, url: "https://example.com/a.png"}},
            {type: :document, source: {type: :text, media_type: "text/plain", data: "secret"}}
          ]
        },
        {role: :assistant, content: [redacted]}
      ]
    )

    span = only_span
    assert_equal(
      [
        {"role" => "user", "parts" => [{"type" => "anthropic_image"}, {"type" => "anthropic_document"}]},
        {"role" => "assistant", "parts" => [{"type" => "anthropic_redacted_thinking"}]}
      ],
      json_attribute(span, "gen_ai.input.messages")
    )
    assert_equal(
      [{"type" => "anthropic_redacted_thinking"}, {"type" => "text", "content" => "Hi"}],
      json_attribute(span, "gen_ai.output.messages").first["parts"]
    )
    refute_match(/opaque|secret|example\.com/, span.attributes.to_h.to_json)
  end

  def test_a_streamed_block_with_no_part_of_its_own_is_a_part_with_only_its_prefixed_type
    stub_messages(
      stream_response(
        [
          STREAM_EVENTS[0],
          {
            type: "content_block_start",
            index: 0,
            content_block: {type: "redacted_thinking", data: "opaque"}
          },
          {type: "content_block_stop", index: 0},
          *STREAM_EVENTS[4..]
        ]
      )
    )
    content_client.messages.stream(**PARAMS).until_done

    span = only_span
    assert_equal(
      [{"role" => "assistant", "parts" => [{"type" => "anthropic_redacted_thinking"}]}],
      json_attribute(span, "gen_ai.output.messages")
    )
    refute_match(/opaque/, span.attributes.to_h.to_json)
  end

  def test_a_tool_call_response_holds_the_content_blocks_of_the_tool_result
    cited = {
      type: :text,
      text: "sunny",
      citations: [
        {type: :char_location, cited_text: "sun", document_index: 0, start_char_index: 0, end_char_index: 3}
      ],
      cache_control: {type: :ephemeral}
    }
    found = {
      type: :search_result,
      source: "https://example.com",
      title: "Weather",
      content: [{type: :text, text: "sunny"}]
    }
    image = {type: :image, source: {type: :url, url: "https://example.com/a.png"}}
    stub_messages
    content_client.messages.create(
      **PARAMS,
      messages: [
        {
          role: :user,
          content: [
            {type: :tool_result, tool_use_id: "toolu_1", content: "sunny"},
            {type: :tool_result, tool_use_id: "toolu_2", content: [cited, found, image]},
            {type: :tool_result, tool_use_id: "toolu_3"}
          ]
        }
      ]
    )

    assert_equal(
      [
        [{"type" => "text", "text" => "sunny"}],
        # A `text` block and a `search_result` block have all their fields, and any other block
        # only its type, with no prefix.
        [JSON.parse(cited.to_json), JSON.parse(found.to_json), {"type" => "image"}],
        []
      ],
      json_attribute(only_span, "gen_ai.input.messages").first["parts"].map { _1["response"] }
    )
  end

  SERVER_TOOL_USES = [
    {type: "server_tool_use", id: "srvtoolu_1", name: "web_search", input: {query: "weather"}},
    {type: "mcp_tool_use", id: "mcptoolu_1", name: "lookup", server_name: "records", input: {id: 1}}
  ].freeze

  SERVER_TOOL_CALLS = [
    {
      "type" => "tool_call",
      "id" => "srvtoolu_1",
      "name" => "web_search",
      "arguments" => {"query" => "weather"}
    },
    {
      "type" => "tool_call",
      "id" => "mcptoolu_1",
      "name" => "lookup",
      "arguments" => {"id" => 1},
      "anthropic_mcp_server_name" => "records"
    }
  ].freeze

  def test_a_server_tool_use_and_an_mcp_tool_use_are_tool_calls
    stub_messages(
      {status: 200, body: MESSAGE.merge(content: SERVER_TOOL_USES).to_json},
      url: "#{MESSAGES_URL}?beta=true"
    )
    content_client.beta.messages.create(
      **PARAMS,
      messages: [{role: :user, content: "Hi"}, {role: :assistant, content: SERVER_TOOL_USES}]
    )

    span = only_span
    assert_equal(SERVER_TOOL_CALLS, json_attribute(span, "gen_ai.input.messages").last["parts"])
    assert_equal(SERVER_TOOL_CALLS, json_attribute(span, "gen_ai.output.messages").first["parts"])
  end

  def test_a_streamed_server_tool_use_and_mcp_tool_use_are_tool_calls
    blocks = SERVER_TOOL_USES.each_with_index.flat_map do |block, index|
      [
        {type: "content_block_start", index: index, content_block: block.merge(input: {})},
        {
          type: "content_block_delta",
          index: index,
          delta: {type: "input_json_delta", partial_json: block[:input].to_json}
        },
        {type: "content_block_stop", index: index}
      ]
    end
    stub_messages(
      stream_response([STREAM_EVENTS[0], *blocks, *STREAM_EVENTS[4..]]),
      url: "#{MESSAGES_URL}?beta=true"
    )
    content_client.beta.messages.stream(**PARAMS).until_done

    assert_equal(SERVER_TOOL_CALLS, json_attribute(only_span, "gen_ai.output.messages").first["parts"])
  end

  # Only the first block is a `tool_use` with a toolset name: the name of the next one is `nil`, the
  # third has none, and the last two are not `tool_use` blocks.
  TOOLSET_TOOL_USES = [
    {type: "tool_use", id: "toolu_1", name: "screenshot", input: {}, toolset_name: "computer"},
    {type: "tool_use", id: "toolu_2", name: "get_weather", input: {city: "Paris"}, toolset_name: nil},
    {type: "tool_use", id: "toolu_3", name: "get_time", input: {}},
    {
      type: "server_tool_use",
      id: "srvtoolu_1",
      name: "web_search",
      input: {query: "weather"},
      toolset_name: "computer"
    },
    {
      type: "mcp_tool_use",
      id: "mcptoolu_1",
      name: "lookup",
      server_name: "records",
      input: {id: 1},
      toolset_name: "computer"
    }
  ].freeze

  TOOLSET_TOOL_CALLS = [
    {
      "type" => "tool_call",
      "id" => "toolu_1",
      "name" => "screenshot",
      "arguments" => {},
      "anthropic_toolset_name" => "computer"
    },
    {"type" => "tool_call", "id" => "toolu_2", "name" => "get_weather", "arguments" => {"city" => "Paris"}},
    {"type" => "tool_call", "id" => "toolu_3", "name" => "get_time", "arguments" => {}},
    *SERVER_TOOL_CALLS
  ].freeze

  # The resource, its URL, and the blocks with their parts: an `mcp_tool_use` block is of the beta API only.
  def toolset_surface(beta)
    count = beta ? 5 : 4
    [
      beta ? content_client.beta.messages : content_client.messages,
      beta ? "#{MESSAGES_URL}?beta=true" : MESSAGES_URL,
      TOOLSET_TOOL_USES.first(count),
      TOOLSET_TOOL_CALLS.first(count)
    ]
  end

  def assert_only_a_tool_use_with_a_toolset_name_has_it(beta:)
    messages, url, uses, calls = toolset_surface(beta)
    stub_messages({status: 200, body: MESSAGE.merge(content: uses).to_json}, url: url)
    messages.create(**PARAMS, messages: [{role: :user, content: "Hi"}, {role: :assistant, content: uses}])

    span = only_span
    assert_equal(calls, json_attribute(span, "gen_ai.input.messages").last["parts"])
    assert_equal(calls, json_attribute(span, "gen_ai.output.messages").first["parts"])
    # The key comes after `arguments`.
    assert_equal(
      %w[type id name arguments anthropic_toolset_name],
      json_attribute(span, "gen_ai.output.messages").first["parts"].first.keys
    )
  end

  def assert_only_a_streamed_tool_use_with_a_toolset_name_has_it(beta:)
    messages, url, uses, calls = toolset_surface(beta)
    blocks = uses.each_with_index.flat_map do |block, index|
      [
        {type: "content_block_start", index: index, content_block: block.merge(input: {})},
        {
          type: "content_block_delta",
          index: index,
          delta: {type: "input_json_delta", partial_json: block[:input].to_json}
        },
        {type: "content_block_stop", index: index}
      ]
    end
    stub_messages(stream_response([STREAM_EVENTS[0], *blocks, *STREAM_EVENTS[4..]]), url: url)
    messages.stream(**PARAMS).until_done

    assert_equal(calls, json_attribute(only_span, "gen_ai.output.messages").first["parts"])
  end

  def test_only_a_tool_use_with_a_toolset_name_has_it_on_its_tool_call
    assert_only_a_tool_use_with_a_toolset_name_has_it(beta: false)
  end

  def test_only_a_beta_tool_use_with_a_toolset_name_has_it_on_its_tool_call
    assert_only_a_tool_use_with_a_toolset_name_has_it(beta: true)
  end

  def test_only_a_streamed_tool_use_with_a_toolset_name_has_it_on_its_tool_call
    assert_only_a_streamed_tool_use_with_a_toolset_name_has_it(beta: false)
  end

  def test_only_a_streamed_beta_tool_use_with_a_toolset_name_has_it_on_its_tool_call
    assert_only_a_streamed_tool_use_with_a_toolset_name_has_it(beta: true)
  end

  def test_the_toolset_name_of_a_string_keyed_tool_use_and_of_a_model_is_recorded
    block = TOOLSET_TOOL_USES.first
    stub_messages
    content_client.messages.create(
      **PARAMS,
      messages: [
        {role: :assistant, content: [JSON.parse(block.to_json), Anthropic::ToolUseBlockParam.new(**block)]}
      ]
    )

    assert_equal(
      [TOOLSET_TOOL_CALLS.first] * 2,
      json_attribute(only_span, "gen_ai.input.messages").first["parts"]
    )
  end

  RESULT_BLOCKS = [
    {
      type: "web_search_tool_result",
      tool_use_id: "srvtoolu_1",
      content: [
        {
          type: "web_search_result",
          url: "https://example.com",
          title: "Weather",
          page_age: nil,
          encrypted_content: "opaque"
        }
      ]
    },
    {
      type: "web_search_tool_result",
      tool_use_id: "srvtoolu_2",
      content: {type: "web_search_tool_result_error", error_code: "max_uses_exceeded"}
    },
    {
      type: "code_execution_tool_result",
      tool_use_id: "srvtoolu_3",
      content: {
        type: "code_execution_result",
        stdout: "4",
        stderr: "",
        return_code: 0,
        content: [{type: "code_execution_output", file_id: "file_1"}]
      }
    },
    {type: "mcp_tool_result", tool_use_id: "mcptoolu_1", is_error: false, content: "found"},
    {
      type: "mcp_tool_result",
      tool_use_id: "mcptoolu_2",
      is_error: false,
      content: [
        {type: "text", text: "found"},
        {type: "image", source: {type: "base64", media_type: "image/png", data: "aW1hZ2U="}},
        {text: "untyped"}
      ]
    },
    {
      type: "text_editor_code_execution_tool_result",
      tool_use_id: "srvtoolu_4",
      content: {type: "text_editor_code_execution_view_result", file_type: "image", content: "aW1hZ2U="}
    },
    {
      type: "web_fetch_tool_result",
      tool_use_id: "srvtoolu_5",
      content: {
        type: "web_fetch_result",
        url: "https://example.com",
        retrieved_at: nil,
        content: {
          type: "document",
          source: {type: "base64", media_type: "application/pdf", data: "cGRm"}
        }
      }
    },
    {type: "mcp_tool_result", tool_use_id: "mcptoolu_3", is_error: false}
  ].freeze

  RESULT_RESPONSES = [
    # A `web_search_result` is kept, without its encrypted field.
    [
      {"type" => "web_search_result", "url" => "https://example.com", "title" => "Weather", "page_age" => nil}
    ],
    # A content that is one object is kept: an error, and a result.
    {"type" => "web_search_tool_result_error", "error_code" => "max_uses_exceeded"},
    {
      "type" => "code_execution_result",
      "stdout" => "4",
      "stderr" => "",
      "return_code" => 0,
      "content" => [{"type" => "code_execution_output", "file_id" => "file_1"}]
    },
    [{"type" => "text", "text" => "found"}],
    [{"type" => "text", "text" => "found"}, {"type" => "image"}, {"type" => "unknown"}],
    {"type" => "text_editor_code_execution_view_result", "file_type" => "image"},
    {
      "type" => "web_fetch_result",
      "url" => "https://example.com",
      "retrieved_at" => nil,
      "content" => {"type" => "document"}
    },
    []
  ].freeze

  def test_a_result_block_is_a_tool_call_response_with_its_content
    # The response's blocks are models, and the request's are Hashes.
    stub_messages(
      {status: 200, body: MESSAGE.merge(content: RESULT_BLOCKS).to_json},
      url: "#{MESSAGES_URL}?beta=true"
    )
    content_client.beta.messages.create(
      **PARAMS,
      messages: [{role: :user, content: "Hi"}, {role: :assistant, content: RESULT_BLOCKS}]
    )

    span = only_span
    [
      json_attribute(span, "gen_ai.input.messages").last["parts"],
      json_attribute(span, "gen_ai.output.messages").first["parts"]
    ].each do |parts|
      assert_equal(["tool_call_response"], parts.map { _1["type"] }.uniq)
      assert_equal(RESULT_BLOCKS.map { _1[:tool_use_id] }, parts.map { _1["id"] })
      assert_equal(RESULT_RESPONSES, parts.map { _1["response"] })
    end
    refute_match(/opaque|aW1hZ2U=|cGRm/, span.attributes.to_h.to_json)
  end

  def test_a_tool_result_block_keeps_its_fields_except_the_encrypted_ones
    cited = {
      type: "text",
      text: "sunny",
      citations: [
        {
          type: "web_search_result_location",
          cited_text: "sun",
          url: "https://example.com",
          title: "Weather",
          encrypted_index: "opaque"
        }
      ]
    }
    found = {type: "search_result", source: "https://example.com", title: "Weather", content: [cited]}
    stub_messages
    content_client.messages.create(
      **PARAMS,
      messages: [
        {role: :user, content: [{type: :tool_result, tool_use_id: "toolu_1", content: [cited, found]}]}
      ]
    )

    kept = JSON.parse(cited.to_json)
    kept["citations"].first.delete("encrypted_index")
    assert_equal(
      [kept, JSON.parse(found.to_json).merge("content" => [kept])],
      json_attribute(only_span, "gen_ai.input.messages").first["parts"].first["response"]
    )
  end

  def test_a_block_with_no_type_is_a_part_with_the_unknown_type
    stub_messages
    content_client.messages.create(**PARAMS, messages: [{role: :user, content: [{text: "untyped"}]}])

    assert_equal(
      [{"type" => "anthropic_unknown"}],
      json_attribute(only_span, "gen_ai.input.messages").first["parts"]
    )
  end

  def test_the_content_mode_adds_the_stop_sequences_as_an_array_of_strings
    stub_messages
    content_client.messages.create(**PARAMS, stop_sequences: %w[END STOP])
    stub_messages(url: "#{MESSAGES_URL}?beta=true")
    content_client.beta.messages.create(**PARAMS, stop_sequences: ["END"])
    stub_messages(stream_response)
    content_client.messages.stream(**PARAMS, stop_sequences: ["END"]).each {}
    content_client.messages.stream_raw(**PARAMS, stop_sequences: ["END"]).each {}

    recorded = spans.map { _1.attributes["gen_ai.request.stop_sequences"] }
    assert_equal([%w[END STOP], ["END"], ["END"], ["END"]], recorded)
  end

  def test_stop_sequences_that_are_unset_or_empty_and_the_metadata_only_mode_have_no_attribute
    stub_messages
    content_client.messages.create(**PARAMS)
    content_client.messages.create(**PARAMS, stop_sequences: [])
    client.messages.create(**PARAMS, stop_sequences: ["END"])

    assert_equal(3, spans.length)
    spans.each { refute_includes(_1.attributes.keys, "gen_ai.request.stop_sequences") }
  end

  def test_stop_sequences_that_are_not_valid_text_are_left_out_and_the_other_content_stays
    body = {messages: [{role: :user, content: "Hi"}], system: "Be brief."}
    binary = "caf\xC3\xA9".b
    latin = "caf\xE9".dup.force_encoding(Encoding::ISO_8859_1)
    cases = {
      ["END", binary] => %W[END caf\u00e9],
      [latin] => ["caf\u00e9"],
      ["END", "\xFF".b] => nil,
      ["\xFF".dup.force_encoding(Encoding::UTF_8), "END"] => nil
    }
    recorded = cases.each_key.map do |stop_sequences|
      span = @provider.tracer("test").start_span("chat")
      Anthropic::Helpers::Tracing.set_message_content_attributes(span, {**body, stop_sequences:}, nil)
      span.finish
      assert_equal(
        %w[gen_ai.input.messages gen_ai.system_instructions],
        (spans.last.attributes.keys - ["gen_ai.request.stop_sequences"]).sort
      )
      spans.last.attributes["gen_ai.request.stop_sequences"]
    end

    assert_equal(cases.values, recorded)
    recorded.compact.flatten.each do |text|
      assert_equal(Encoding::UTF_8, text.encoding)
      assert_predicate(text, :valid_encoding?)
    end
    # The caller's strings are as they were.
    assert_equal(Encoding::BINARY, binary.encoding)
    assert_equal(Encoding::ISO_8859_1, latin.encoding)
  end

  def test_the_environment_variable_selects_the_content_mode_for_a_client_that_is_given_no_option
    stub_messages
    with_env("ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE" => "CONTENT") do
      with_global_provider(@provider) { client(open_telemetry: nil).messages.create(**PARAMS) }
      client.messages.create(**PARAMS)
    end

    assert_equal([true, false], spans.map { _1.attributes.key?("gen_ai.input.messages") })
  end

  def test_the_former_name_of_the_content_mode_variable_is_not_read
    stub_messages
    with_env(
      "ANTHROPIC_OPEN_TELEMETRY_CONTENT_MODE" => "content",
      "ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE" => nil
    ) do
      with_global_provider(@provider) { client(open_telemetry: nil).messages.create(**PARAMS) }
    end

    refute_includes(only_span.attributes.keys, "gen_ai.input.messages")
  end

  # Each stream helper and each `create`, with the URL it requests.
  BOUNDED_CALLS = {
    create: [MESSAGES_URL, ->(c, **kw) { c.messages.create(**PARAMS, **kw) }],
    beta_create: ["#{MESSAGES_URL}?beta=true", ->(c, **kw) { c.beta.messages.create(**PARAMS, **kw) }],
    stream: [MESSAGES_URL, ->(c, **kw) { c.messages.stream(**PARAMS, **kw).until_done }],
    beta_stream: ["#{MESSAGES_URL}?beta=true", ->(c, **kw) { c.beta.messages.stream(**PARAMS, **kw).until_done }]
  }.freeze

  BOUNDED_CALLS.each do |name, (url, call)|
    define_method(:"test_max_content_bytes_replaces_the_bound_of_#{name}") do
      response = name.to_s.end_with?("stream") ? stream_response : nil
      stub_messages(*[response].compact, url: url)
      messages = Array.new(3) { {role: :user, content: "#{_1}#{'x' * 100}"} }
      call.call(content_client(max_content_bytes: 300), messages: messages)
      call.call(content_client, messages: messages)

      bounded, whole = spans
      input = json_attribute(bounded, "gen_ai.input.messages")
      assert_equal([[], [], ["2#{'x' * 100}"]], input.map { |message| message["parts"].map { _1["content"] } })
      assert_equal(true, bounded.attributes[TRUNCATED])
      assert_operator(content_bytes(bounded), :<=, 300)
      assert_equal(3, json_attribute(whole, "gen_ai.input.messages").count { _1["parts"].any? })
      refute_includes(whole.attributes.keys, TRUNCATED)
    end
  end

  def test_the_environment_variable_sets_the_bound_for_a_client_that_is_given_no_option
    stub_messages
    messages = Array.new(3) { {role: :user, content: "#{_1}#{'x' * 100}"} }
    with_env(
      "ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE" => "content",
      "ANTHROPIC_OPEN_TELEMETRY_TRACES_MAX_CONTENT_BYTES" => " 300 "
    ) do
      with_global_provider(@provider) { client(open_telemetry: nil).messages.create(**PARAMS, messages: messages) }
      content_client.messages.create(**PARAMS, messages: messages)
    end

    assert_equal([true, nil], spans.map { _1.attributes[TRUNCATED] })
    assert_operator(content_bytes(spans.first), :<=, 300)
    assert_equal([true, true], spans.map { _1.attributes.key?("gen_ai.input.messages") })
  end

  def test_an_invalid_bound_in_the_environment_is_ignored
    stub_messages
    messages = Array.new(3) { {role: :user, content: "#{_1}#{'x' * 100}"} }
    ["0", "-5", "1.5", "1e3", "1_000", "many", ""].each do |value|
      with_env(
        "ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE" => "content",
        "ANTHROPIC_OPEN_TELEMETRY_TRACES_MAX_CONTENT_BYTES" => value
      ) do
        with_global_provider(@provider) { client(open_telemetry: nil).messages.create(**PARAMS, messages: messages) }
      end
    end

    assert_equal(7, spans.length)
    spans.each do |span|
      assert_equal(3, json_attribute(span, "gen_ai.input.messages").count { _1["parts"].any? })
      refute_includes(span.attributes.keys, TRUNCATED)
    end
  end

  TOOL_STREAM_EVENTS = [
    *STREAM_EVENTS[0..3],
    {
      type: "content_block_start",
      index: 1,
      content_block: {type: "tool_use", id: "toolu_2", name: "get_weather", input: {}}
    },
    {type: "content_block_delta", index: 1, delta: {type: "input_json_delta", partial_json: "{\"city\": "}},
    {type: "content_block_delta", index: 1, delta: {type: "input_json_delta", partial_json: "\"Rome\"}"}},
    {type: "content_block_stop", index: 1},
    *STREAM_EVENTS[4..]
  ].freeze

  TOOL_STREAM_OUTPUT = [
    {
      "role" => "assistant",
      "parts" => [
        {"type" => "text", "content" => "Hi"},
        {"type" => "tool_call", "id" => "toolu_2", "name" => "get_weather", "arguments" => {"city" => "Rome"}}
      ]
    }
  ].freeze

  class OnFinish
    def initialize(&block) = @block = block
    def on_start(_span, _parent_context) = nil
    def on_finish(span) = @block.call(span)
    def force_flush(**) = 0
    def shutdown(**) = 0
  end

  # Reads the stream helper that `streams` returns to its end, and checks that the span has the
  # content the helper accumulated, which the helper still holds when the span ends and after.
  def assert_output_from_the_stream_helper(url: MESSAGES_URL, &streams)
    stub_messages(stream_response(TOOL_STREAM_EVENTS), url: url)
    stream = nil
    held = nil
    @provider.add_span_processor(
      OnFinish.new do
        held = stream.instance_variable_get(:@accumated_message_snapshot).content.map(&:deep_to_h)
      end
    )
    stream = streams.call(content_client)
    stream.until_done

    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal(TOOL_STREAM_OUTPUT, json_attribute(span, "gen_ai.output.messages"))
    content = [
      {type: :text, text: "Hi"},
      {type: :tool_use, id: "toolu_2", name: "get_weather", input: {city: "Rome"}}
    ]
    assert_equal(content, held)
    assert_equal(content, stream.accumulated_message.content.map(&:deep_to_h))
  end

  def test_a_streamed_response_has_the_output_the_stream_helper_accumulated
    assert_output_from_the_stream_helper { _1.messages.stream(**PARAMS) }
  end

  def test_a_streamed_beta_response_has_the_output_the_stream_helper_accumulated
    url = "#{MESSAGES_URL}?beta=true"
    assert_output_from_the_stream_helper(url: url) { _1.beta.messages.stream(**PARAMS) }
  end

  def test_a_raw_stream_has_the_request_content_and_the_response_but_no_output
    stub_messages(stream_response(TOOL_STREAM_EVENTS))
    events = content_client.messages.stream_raw(**PARAMS, messages: [{role: :user, content: "Hi"}]).to_a

    # The events reach the application as the server sent them: nothing has accumulated into them.
    assert_equal("", events[1].content_block.text)
    assert_equal({}, events[4].content_block.input)
    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal(
      [{"role" => "user", "parts" => [{"type" => "text", "content" => "Hi"}]}],
      json_attribute(span, "gen_ai.input.messages")
    )
    assert_equal("msg_1", span.attributes["gen_ai.response.id"])
    assert_equal("claude-sonnet-4-5-20250929", span.attributes["gen_ai.response.model"])
    assert_equal(15, span.attributes["gen_ai.usage.input_tokens"])
    assert_equal(5, span.attributes["gen_ai.usage.output_tokens"])
    assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
    assert_nil(span.attributes["gen_ai.output.messages"])
  end

  STREAM_HELPERS = {
    MESSAGES_URL => ->(c, **kw) { c.messages.stream(**PARAMS, **kw) },
    "#{MESSAGES_URL}?beta=true" => ->(c, **kw) { c.beta.messages.stream(**PARAMS, **kw) }
  }.freeze

  TEXT_OUTPUT = [{"role" => "assistant", "parts" => [{"type" => "text", "content" => "Hi"}]}].freeze

  # The tool use has yet to end, so the helper holds the text of unfinished JSON as its input.
  OPEN_TOOL_USE_OUTPUT = [
    {
      "role" => "assistant",
      "parts" => [
        {"type" => "text", "content" => "Hi"},
        {"type" => "tool_call", "id" => "toolu_2", "name" => "get_weather", "arguments" => {}}
      ]
    }
  ].freeze

  # Calls `block` with the span of each stream helper, once `reads` has read the helper's stream of
  # `events`, and with the helper.
  def each_span_of_a_stream_helper(events, reads, client: content_client, **params, &block)
    STREAM_HELPERS.each do |url, helper|
      @exporter.reset
      stub_messages(stream_response(events), url: url)
      stream = helper.call(client, **params)
      reads.call(stream)
      block.call(only_span, stream)
    end
  end

  def test_a_stream_the_server_ends_before_message_stop_has_the_output_accumulated_until_then
    cuts = {
      # After a text delta.
      2 => TEXT_OUTPUT,
      # After the start of a tool use, whose input is an empty object until its first delta.
      4 => OPEN_TOOL_USE_OUTPUT,
      # Inside the input of the tool use.
      5 => OPEN_TOOL_USE_OUTPUT,
      # After the end of the tool use.
      7 => TOOL_STREAM_OUTPUT
    }
    cuts.each do |last, output|
      each_span_of_a_stream_helper(TOOL_STREAM_EVENTS[0..last], :until_done.to_proc) do |span|
        assert_equal(ERROR, span.status.code)
        assert_equal("api_error", span.attributes["error.type"])
        assert_equal("msg_1", span.attributes["gen_ai.response.id"])
        assert_nil(span.attributes["anthropic.message.stop_reason"])
        assert_nil(span.attributes["gen_ai.usage.output_tokens"])
        refute_nil(span.attributes["gen_ai.input.messages"])
        assert_equal(output, json_attribute(span, "gen_ai.output.messages"), "cut after event #{last}")
      end
    end
  end

  def test_the_output_of_a_stream_that_ended_early_leaves_the_message_of_the_stream_helper_as_it_is
    each_span_of_a_stream_helper(TOOL_STREAM_EVENTS[0..5], :until_done.to_proc) do |_span, stream|
      message = stream.instance_variable_get(:@accumated_message_snapshot)
      assert_equal("{\"city\": ", message.content.last.input)
    end
  end

  def test_a_stream_helper_that_fails_before_message_stop_has_the_output_accumulated_until_then
    failure = {type: "error", error: {type: "overloaded_error", message: "x"}}
    reads = ->(stream) { assert_raises(Anthropic::Errors::APIStatusError) { stream.until_done } }
    each_span_of_a_stream_helper([*TOOL_STREAM_EVENTS[0..5], failure], reads) do |span|
      assert_equal(ERROR, span.status.code)
      assert_equal("overloaded_error", span.attributes["error.type"])
      refute_nil(span.attributes["gen_ai.input.messages"])
      assert_equal(OPEN_TOOL_USE_OUTPUT, json_attribute(span, "gen_ai.output.messages"))
    end
  end

  def test_a_stream_helper_whose_read_fails_has_the_output_accumulated_until_then
    reads = ->(stream) { assert_raises(IOError) { stream.until_done } }
    # The read fails once the body, which stops inside the tool use, has been read.
    c = content_client(middleware: [DROPPED_CONNECTION])
    each_span_of_a_stream_helper(TOOL_STREAM_EVENTS[0..5], reads, client: c) do |span|
      assert_equal(ERROR, span.status.code)
      assert_equal("client_error", span.attributes["error.type"])
      assert_equal(OPEN_TOOL_USE_OUTPUT, json_attribute(span, "gen_ai.output.messages"))
    end
  end

  def test_a_stream_helper_the_application_stops_reading_has_the_output_accumulated_until_then
    closes = lambda do |stream|
      events = stream.to_enum
      nil until events.next.type == :input_json
      stream.close
    end
    reads = {
      ->(stream) { stream.each { break if _1.type == :text } } => TEXT_OUTPUT,
      closes => OPEN_TOOL_USE_OUTPUT
    }
    reads.each do |read, output|
      each_span_of_a_stream_helper(TOOL_STREAM_EVENTS, read) do |span|
        assert_equal(UNSET, span.status.code)
        assert_nil(span.attributes["error.type"])
        assert_nil(span.attributes["anthropic.message.stop_reason"])
        assert_equal(output, json_attribute(span, "gen_ai.output.messages"))
      end
    end
  end

  def test_a_stream_helper_without_a_message_from_the_events_it_read_has_no_output
    stray = {type: "content_block_delta", index: 3, delta: {type: "text_delta", text: "!"}}
    streams = {
      # The server sends nothing.
      [] => :until_done.to_proc,
      # No `message_start`, so the helper has no Message.
      TOOL_STREAM_EVENTS[1..3] => ->(stream) { assert_raises(StandardError) { stream.until_done } },
      # A delta for a block that never started, which the helper cannot add to its Message.
      [*TOOL_STREAM_EVENTS[0..2], stray] => ->(stream) { assert_raises(StandardError) { stream.until_done } }
    }
    streams.each do |events, reads|
      each_span_of_a_stream_helper(events, reads) do |span|
        refute_nil(span.attributes["gen_ai.input.messages"])
        assert_nil(span.attributes["gen_ai.output.messages"], "after #{events.map { _1[:type] }}")
      end
    end
  end

  def test_a_raw_stream_that_ends_before_message_stop_has_no_output
    STREAM_HELPERS.each_key do |url|
      stub_messages(stream_response(TOOL_STREAM_EVENTS[0..5]), url: url)
    end
    c = content_client
    c.messages.stream_raw(**PARAMS).each {}
    c.beta.messages.stream_raw(**PARAMS).each { break if _1.type == :content_block_delta }

    assert_equal([ERROR, UNSET], spans.map { _1.status.code })
    spans.each do |span|
      assert_equal("msg_1", span.attributes["gen_ai.response.id"])
      refute_nil(span.attributes["gen_ai.input.messages"])
      assert_nil(span.attributes["gen_ai.output.messages"])
    end
  end

  def test_a_stream_that_ended_early_has_no_output_in_the_metadata_only_mode
    each_span_of_a_stream_helper(TOOL_STREAM_EVENTS[0..5], :until_done.to_proc, client: client) do |span|
      assert_equal(ERROR, span.status.code)
      attributes = span.attributes.keys
      assert_empty(attributes & %w[gen_ai.system_instructions gen_ai.input.messages gen_ai.output.messages])
    end
  end

  def test_the_output_of_a_stream_that_ended_early_counts_toward_the_bound
    text = "x" * 300_000
    delta = {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: text}}
    messages = [{role: :user, content: "0#{text}"}, {role: :user, content: "1#{text}"}]
    each_span_of_a_stream_helper(
      [*STREAM_EVENTS[0..1], delta],
      :until_done.to_proc,
      messages: messages
    ) do |span|
      input = json_attribute(span, "gen_ai.input.messages")
      assert_equal([[], ["1"]], input.map { |message| message["parts"].map { _1["content"][0] } })
      assert_equal(true, span.attributes[TRUNCATED])
      output = json_attribute(span, "gen_ai.output.messages")
      assert_equal([["text", text.length]], output.first["parts"].map { [_1["type"], _1["content"].length] })
    end
  end

  def test_an_accumulated_message_that_cannot_be_recorded_leaves_the_output_out
    stub_messages(stream_response)
    stream = content_client.messages.stream(**PARAMS)
    # Params that cannot be read make recording the Message raise.
    followed = stream.instance_variable_get(:@raw_stream).streamed_message
    followed.instance_variable_set(:@params, Object.new)
    stream.until_done

    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
    refute_nil(span.attributes["gen_ai.input.messages"])
    assert_nil(span.attributes["gen_ai.output.messages"])
  end

  def test_the_stream_helper_adds_no_output_in_the_metadata_only_mode
    stub_messages(stream_response(TOOL_STREAM_EVENTS))
    client.messages.stream(**PARAMS).until_done

    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
    attributes = span.attributes.keys
    assert_empty(attributes & %w[gen_ai.system_instructions gen_ai.input.messages gen_ai.output.messages])
  end

  def test_content_events_are_not_converted_for_the_span
    converted = []
    events = TOOL_STREAM_EVENTS.map do |event|
      model = Anthropic::Internal::Type::Converter.coerce(Anthropic::Models::RawMessageStreamEvent, event)
      model.define_singleton_method(:deep_to_h) do
        converted << self[:type]
        super()
      end
      model
    end
    [true, false].each do |content|
      span = @provider.tracer("test").start_span("chat")
      recorder = Anthropic::Helpers::Tracing::StreamedMessage.new(
        span,
        params: PARAMS,
        start_time: 0.0,
        content: content
      )
      events.each { recorder.observe(_1) }
      recorder.set_attributes
      Anthropic::Helpers::Tracing.set_message_content_attributes(span, PARAMS, nil) if content
      span.finish
    end

    assert_empty(converted)
    assert_equal(%w[end_turn end_turn], spans.map { _1.attributes["anthropic.message.stop_reason"] })
  end

  def test_a_stream_closed_early_and_an_error_response_have_the_request_content_only
    stub_messages(
      stream_response,
      {status: 500, body: {type: "error", error: {type: "api_error", message: "x"}}.to_json}
    )
    c = content_client(max_retries: 0)
    c.messages.stream_raw(**PARAMS).each { break }
    assert_raises(Anthropic::Errors::InternalServerError) { c.messages.create(**PARAMS) }

    assert_equal(2, spans.length)
    spans.each do |span|
      refute_nil(span.attributes["gen_ai.input.messages"])
      assert_nil(span.attributes["gen_ai.output.messages"])
    end
  end

  def test_a_stream_closed_before_reading_it_has_the_request_content_only
    stub_messages(stream_response, stream_response)
    c = content_client
    c.messages.stream_raw(**PARAMS).close
    c.messages.stream(**PARAMS).close

    assert_equal(2, spans.length)
    spans.each do |span|
      assert_equal(UNSET, span.status.code)
      refute_nil(span.attributes["gen_ai.input.messages"])
      assert_nil(span.attributes["gen_ai.output.messages"])
      assert_nil(span.attributes["gen_ai.response.time_to_first_chunk"])
    end
  end

  def test_content_over_the_bound_loses_its_oldest_input_parts_and_their_messages_stay
    stub_messages
    text = "x" * 225_000
    messages = Array.new(5) { {role: :user, content: "#{_1}#{text}"} }
    content_client.messages.create(**PARAMS, messages: messages)

    input = json_attribute(only_span, "gen_ai.input.messages")
    assert_equal(%w[user] * 5, input.map { _1["role"] })
    # Nothing in the content marks the removed parts: the span's attribute does.
    assert_equal(
      [[], [], ["2#{text}"], ["3#{text}"], ["4#{text}"]],
      input.map { |message| message["parts"].map { _1["content"] } }
    )
    assert_equal(true, only_span.attributes[TRUNCATED])
    output = json_attribute(only_span, "gen_ai.output.messages")
    assert_equal([{"type" => "text", "content" => "Hi"}], output.first["parts"])
    assert_operator(only_span.attributes.values.grep(String).sum(&:bytesize), :<=, 750_000)
  end

  def test_a_tool_call_response_with_one_object_over_the_bound_goes_whole
    executed = {
      type: "code_execution_tool_result",
      tool_use_id: "srvtoolu_1",
      content: {type: "code_execution_result", stdout: "x" * 1_100_000, stderr: "", return_code: 0}
    }
    stub_messages(
      {status: 200, body: MESSAGE.to_json},
      {status: 200, body: MESSAGE.merge(content: [*MESSAGE[:content], executed]).to_json}
    )
    messages = [{role: :assistant, content: [executed]}, {role: :user, content: "And now?"}]
    content_client.messages.create(**PARAMS, messages: messages)
    content_client.messages.create(**PARAMS, messages: [{role: :user, content: "And now?"}])

    in_request, in_response = spans
    # In the request it is the first part: only it goes, and its message stays.
    assert_equal(
      [
        {"role" => "assistant", "parts" => []},
        {"role" => "user", "parts" => [{"type" => "text", "content" => "And now?"}]}
      ],
      json_attribute(in_request, "gen_ai.input.messages")
    )
    assert_equal(
      [{"role" => "assistant", "parts" => [{"type" => "text", "content" => "Hi"}]}],
      json_attribute(in_request, "gen_ai.output.messages")
    )
    # In the response it is the last part: every part before it goes, and then it goes too,
    # because only a text is cut.
    assert_equal('[{"role":"user","parts":[]}]', in_response.attributes["gen_ai.input.messages"])
    assert_equal('[{"role":"assistant","parts":[]}]', in_response.attributes["gen_ai.output.messages"])
    assert_equal([true, true], spans.map { _1.attributes[TRUNCATED] })
  end

  def test_the_blocks_of_a_tool_call_response_count_toward_the_bound_and_its_part_goes_whole
    stub_messages
    found = {
      type: :search_result,
      source: "https://example.com",
      title: "Weather",
      content: [{type: :text, text: "x" * 1_100_000}]
    }
    messages = [
      {role: :user, content: [{type: :tool_result, tool_use_id: "toolu_1", content: [found]}]},
      {role: :user, content: "And now?"}
    ]
    content_client.messages.create(**PARAMS, messages: messages)

    assert_equal(
      [
        {"role" => "user", "parts" => []},
        {"role" => "user", "parts" => [{"type" => "text", "content" => "And now?"}]}
      ],
      json_attribute(only_span, "gen_ai.input.messages")
    )
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_one_input_message_over_the_bound_is_left_without_parts
    stub_messages
    content_client.messages.create(**PARAMS, messages: [{role: :user, content: "x" * 1_100_000}])

    # The message stays in its attribute, and the output is whole: the span is under the bound again.
    assert_equal('[{"role":"user","parts":[]}]', only_span.attributes["gen_ai.input.messages"])
    assert_equal(true, only_span.attributes[TRUNCATED])
    output = json_attribute(only_span, "gen_ai.output.messages")
    assert_equal([{"type" => "text", "content" => "Hi"}], output.first["parts"])
  end

  def test_content_under_the_bound_and_a_span_without_content_have_no_truncated_attribute
    stub_messages
    content_client.messages.create(**PARAMS, messages: [{role: :user, content: "Hi"}])
    client.messages.create(**PARAMS, messages: Array.new(5) { {role: :user, content: "x" * 300_000} })

    assert_equal(2, spans.length)
    spans.each { refute_includes(_1.attributes.keys, TRUNCATED) }
  end

  def big_output_response(*sizes)
    content = sizes.each_with_index.map { {type: "text", text: "#{_2}#{'y' * _1}"} }
    {status: 200, body: MESSAGE.merge(content: content).to_json}
  end

  def content_bytes(span)
    names = %w[gen_ai.input.messages gen_ai.output.messages gen_ai.system_instructions]
    span.attributes.values_at(*names).compact.sum(&:bytesize)
  end

  def test_content_still_over_the_bound_loses_the_first_parts_of_the_output_message
    stub_messages(big_output_response(300_000, 300_000, 300_000))
    messages = [{role: :user, content: "old"}, {role: :user, content: "x" * 100_000}]
    content_client.messages.create(**PARAMS, system: "s", messages: messages)

    # The system instructions go first, then the input, all of it, and only then the output, from
    # its start.
    assert_equal("[]", only_span.attributes["gen_ai.system_instructions"])
    assert_equal(
      '[{"role":"user","parts":[]},{"role":"user","parts":[]}]',
      only_span.attributes["gen_ai.input.messages"]
    )
    output = json_attribute(only_span, "gen_ai.output.messages")
    assert_equal(["assistant"], output.map { _1["role"] })
    # The first text is removed, not cut, and the texts after it are whole.
    assert_equal(["1#{'y' * 300_000}", "2#{'y' * 300_000}"], output.first["parts"].map { _1["content"] })
    assert_operator(content_bytes(only_span), :<, 750_000)
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_the_last_output_part_over_the_bound_is_cut_once_the_parts_before_it_are_gone
    stub_messages(big_output_response(10, 10, 1_100_000))
    content_client.messages.create(**PARAMS, messages: [{role: :user, content: "Hi"}])

    assert_equal('[{"role":"user","parts":[]}]', only_span.attributes["gen_ai.input.messages"])
    parts = json_attribute(only_span, "gen_ai.output.messages").first["parts"]
    assert_equal(["text"], parts.map { _1["type"] })
    # The last text is cut, not removed, to what fits: the span is exactly at the bound.
    assert_match(/\A2y+\z/, parts.first["content"])
    assert_equal(750_000, content_bytes(only_span))
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_a_last_reasoning_part_over_the_bound_goes_whole
    content = [{type: "text", text: "Hi"}, {type: "thinking", thinking: "t" * 1_100_000, signature: "sig"}]
    stub_messages({status: 200, body: MESSAGE.merge(content: content).to_json})
    content_client.messages.create(**PARAMS, messages: [{role: :user, content: "Hi"}])

    # Only a text is cut: the reasoning goes whole, after every part before it.
    assert_equal('[{"role":"user","parts":[]}]', only_span.attributes["gen_ai.input.messages"])
    assert_equal('[{"role":"assistant","parts":[]}]', only_span.attributes["gen_ai.output.messages"])
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_a_text_over_the_bound_that_is_not_the_last_part_goes_whole_and_the_tool_call_after_it_stays
    call = {type: "tool_use", id: "toolu_1", name: "get_weather", input: {city: "Paris"}}
    content = [{type: "text", text: "y" * 1_100_000}, call]
    stub_messages({status: 200, body: MESSAGE.merge(content: content).to_json})
    content_client.messages.create(**PARAMS, messages: [{role: :user, content: "Hi"}])

    assert_equal(
      [
        {
          "role" => "assistant",
          "parts" => [
            {
              "type" => "tool_call",
              "id" => "toolu_1",
              "name" => "get_weather",
              "arguments" => {"city" => "Paris"}
            }
          ]
        }
      ],
      json_attribute(only_span, "gen_ai.output.messages")
    )
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_a_text_is_cut_between_two_characters
    whole = "日本🙂" * 110_000
    stub_messages({status: 200, body: MESSAGE.merge(content: [{type: "text", text: whole}]).to_json})
    content_client.messages.create(**PARAMS, messages: [{role: :user, content: "Hi"}])

    text = json_attribute(only_span, "gen_ai.output.messages").first["parts"].first["content"]
    assert_predicate(text, :valid_encoding?)
    assert(whole.start_with?(text))
    # At most the bytes of one character are left unused.
    assert_includes(749_997..750_000, content_bytes(only_span))
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_streamed_output_over_the_bound_loses_its_first_part_and_the_end_of_its_last_text_too
    block = lambda do |index, text|
      [
        {type: "content_block_start", index: index, content_block: {type: "text", text: ""}},
        {type: "content_block_delta", index: index, delta: {type: "text_delta", text: text}},
        {type: "content_block_stop", index: index}
      ]
    end
    events = [
      STREAM_EVENTS.first,
      *block.call(0, "a" * 600_000),
      *block.call(1, "b" * 1_100_000),
      *STREAM_EVENTS.last(2)
    ]
    stub_messages(stream_response(events))
    content_client.messages.stream(**PARAMS, messages: [{role: :user, content: "Hi"}]).each {}

    parts = json_attribute(only_span, "gen_ai.output.messages").first["parts"]
    assert_equal(1, parts.length)
    assert_match(/\Ab+\z/, parts.first["content"])
    assert_equal(750_000, content_bytes(only_span))
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  Tracing = Anthropic::Helpers::Tracing

  def test_input_messages_under_the_bound_are_the_json_of_the_whole_list
    stub_messages
    messages = [{role: :user, content: "héllo €, [1]"}, *CONVERSATION]
    content_client.messages.create(**PARAMS, messages: messages)

    assert_equal(JSON.generate(Tracing.messages(messages)), only_span.attributes["gen_ai.input.messages"])
  end

  def test_system_instructions_over_the_bound_lose_their_parts_before_the_input_and_the_output
    stub_messages
    messages = [
      {role: :user, content: "first"},
      {role: :assistant, content: "second"},
      {role: :user, content: "third"}
    ]
    system = [{type: :text, text: "s" * 1_100_000}, {type: :text, text: "last"}]
    content_client.messages.create(**PARAMS, system: system, messages: messages)

    # The first part goes whole, and the span is under the bound again.
    assert_equal('[{"type":"text","content":"last"}]', only_span.attributes["gen_ai.system_instructions"])
    assert_equal(JSON.generate(Tracing.messages(messages)), only_span.attributes["gen_ai.input.messages"])
    output = json_attribute(only_span, "gen_ai.output.messages")
    assert_equal([{"type" => "text", "content" => "Hi"}], output.first["parts"])
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_stop_sequences_count_toward_the_bound_and_stay_whole
    stub_messages
    stop_sequences = ["a" * 375_000, "b" * 225_000]
    messages = [{role: :user, content: "x" * 100_000}, {role: :user, content: "y" * 100_000}]
    content_client.messages.create(**PARAMS, messages: messages, stop_sequences: stop_sequences)

    # The input messages fit the bound by themselves, and not with the stop sequences.
    assert_equal(stop_sequences, only_span.attributes["gen_ai.request.stop_sequences"])
    input = json_attribute(only_span, "gen_ai.input.messages")
    assert_equal([[], [{"type" => "text", "content" => "y" * 100_000}]], input.map { _1["parts"] })
    assert_equal(true, only_span.attributes[TRUNCATED])
    output = json_attribute(only_span, "gen_ai.output.messages")
    assert_equal([{"type" => "text", "content" => "Hi"}], output.first["parts"])
  end

  def test_stop_sequences_over_the_bound_by_themselves_are_left_out_and_the_rest_stays_whole
    stub_messages
    params = {**PARAMS, messages: [{role: :user, content: "Hi"}], system: "Be brief."}
    content_client.messages.create(**params, stop_sequences: ["a" * 749_994, "b" * 7])

    # The stop sequences are left out whole, and no longer count toward the bound.
    refute_includes(only_span.attributes.keys, "gen_ai.request.stop_sequences")
    assert_equal(
      '[{"type":"text","content":"Be brief."}]',
      only_span.attributes["gen_ai.system_instructions"]
    )
    assert_equal(
      '[{"role":"user","parts":[{"type":"text","content":"Hi"}]}]',
      only_span.attributes["gen_ai.input.messages"]
    )
    assert_equal(
      '[{"role":"assistant","parts":[{"type":"text","content":"Hi"}]}]',
      only_span.attributes["gen_ai.output.messages"]
    )
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_stop_sequences_exactly_at_the_bound_stay_and_empty_the_system_instructions_the_input_and_the_output
    stub_messages
    stop_sequences = ["a" * 749_994, "b" * 6]
    params = {**PARAMS, messages: [{role: :user, content: "Hi"}], system: "Be brief."}
    content_client.messages.create(**params, stop_sequences: stop_sequences)

    assert_equal(stop_sequences, only_span.attributes["gen_ai.request.stop_sequences"])
    assert_equal("[]", only_span.attributes["gen_ai.system_instructions"])
    assert_equal('[{"role":"user","parts":[]}]', only_span.attributes["gen_ai.input.messages"])
    # The last part is a text, which stays with none of its content.
    assert_equal(
      '[{"role":"assistant","parts":[{"type":"text","content":""}]}]',
      only_span.attributes["gen_ai.output.messages"]
    )
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_streamed_stop_sequences_over_the_bound_are_left_out_with_and_without_the_output
    stub_messages(stream_response(STREAM_EVENTS))
    params = {**PARAMS, messages: [{role: :user, content: "Hi"}], stop_sequences: ["a" * 1_100_000]}
    stream = content_client.messages.stream(**params)
    stream.each {}

    refute_includes(only_span.attributes.keys, "gen_ai.request.stop_sequences")
    assert_equal(
      '[{"role":"user","parts":[{"type":"text","content":"Hi"}]}]',
      only_span.attributes["gen_ai.input.messages"]
    )
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  def test_stop_sequences_that_are_not_text_are_left_out_and_the_span_is_not_marked
    span = @provider.tracer("test").start_span("chat")
    # Longer than the bound, which the rest of the content fits.
    body = {messages: [], stop_sequences: ["\xFF".b * 100]}
    Anthropic::Helpers::Tracing.set_message_content_attributes(span, body, nil, limit: 10)
    span.finish

    assert_equal({"gen_ai.input.messages" => "[]"}, only_span.attributes)
  end

  def test_no_input_messages_are_an_empty_list_even_when_the_other_content_attributes_exceed_the_bound
    stub_messages
    content_client.messages.create(**PARAMS, system: "s" * 1_100_000, messages: [])

    # No input part was there to remove. The system instructions lost their part, and the output is whole.
    assert_equal("[]", only_span.attributes["gen_ai.input.messages"])
    assert_equal("[]", only_span.attributes["gen_ai.system_instructions"])
    output = json_attribute(only_span, "gen_ai.output.messages")
    assert_equal([{"type" => "text", "content" => "Hi"}], output.first["parts"])
    assert_equal(true, only_span.attributes[TRUNCATED])
  end

  CONTENT_ATTRIBUTES = {
    system: "gen_ai.system_instructions",
    input: "gen_ai.input.messages",
    output: "gen_ai.output.messages"
  }.freeze

  def fitted_span(bound, system: nil, input: nil, output: nil, stop_sequences: nil)
    span = @provider.tracer("test").start_span("chat")
    others = {CONTENT_ATTRIBUTES[:system] => system, CONTENT_ATTRIBUTES[:output] => output}
    Tracing.set_content_attributes(span, input, others, stop_sequences: stop_sequences, limit: bound)
    span.finish
    spans.last
  end

  # The cases that every SDK shares. Each has the most bytes the content holds, the content, the
  # content that is expected of it, whether the span is marked, and the bytes that are left.
  SIZE_BOUND_CASES = {
    under_the_bound_is_unchanged: {
      bound: 1000,
      system: [{type: "text", content: "Be brief."}],
      input: [{role: "user", parts: [{type: "text", content: "hi"}]}],
      output: [{role: "assistant", parts: [{type: "text", content: "hello"}]}],
      expected: {
        system: [{type: "text", content: "Be brief."}],
        input: [{role: "user", parts: [{type: "text", content: "hi"}]}],
        output: [{role: "assistant", parts: [{type: "text", content: "hello"}]}]
      },
      truncated: false,
      size: 163
    },
    exactly_at_the_bound_is_unchanged: {
      bound: 163,
      system: [{type: "text", content: "Be brief."}],
      input: [{role: "user", parts: [{type: "text", content: "hi"}]}],
      output: [{role: "assistant", parts: [{type: "text", content: "hello"}]}],
      expected: {
        system: [{type: "text", content: "Be brief."}],
        input: [{role: "user", parts: [{type: "text", content: "hi"}]}],
        output: [{role: "assistant", parts: [{type: "text", content: "hello"}]}]
      },
      truncated: false,
      size: 163
    },
    system_parts_go_first: {
      bound: 260,
      system: [{type: "text", content: "S1-#{'s' * 60}"}, {type: "text", content: "S2 stays"}],
      input: [{role: "user", parts: [{type: "text", content: "question"}]}],
      output: [{role: "assistant", parts: [{type: "text", content: "answer"}]}],
      expected: {
        system: [{type: "text", content: "S2 stays"}],
        input: [{role: "user", parts: [{type: "text", content: "question"}]}],
        output: [{role: "assistant", parts: [{type: "text", content: "answer"}]}]
      },
      truncated: true,
      size: 169
    },
    input_parts_follow_and_a_message_is_left_without_parts: {
      bound: 222,
      system: [{type: "text", content: "sys-#{'s' * 30}"}],
      input: [
        {role: "user", parts: [{type: "text", content: "old-#{'o' * 40}"}, {type: "anthropic_image"}]},
        {role: "assistant", parts: [{type: "text", content: "mid"}]},
        {role: "user", parts: [{type: "text", content: "last"}]}
      ],
      output: [{role: "assistant", parts: [{type: "text", content: "answer"}]}],
      expected: {
        system: [],
        input: [
          {role: "user", parts: []},
          {role: "assistant", parts: [{type: "text", content: "mid"}]},
          {role: "user", parts: [{type: "text", content: "last"}]}
        ],
        output: [{role: "assistant", parts: [{type: "text", content: "answer"}]}]
      },
      truncated: true,
      size: 219
    },
    parts_not_whole_messages_are_removed_and_absent_attributes_stay_absent: {
      bound: 180,
      system: nil,
      input: [
        {
          role: "user",
          parts: [
            {type: "text", content: "a-#{'a' * 30}"},
            {type: "text", content: "b-#{'b' * 30}"},
            {type: "text", content: "c stays"}
          ]
        },
        {role: "user", parts: [{type: "text", content: "newest"}]}
      ],
      output: nil,
      expected: {
        system: nil,
        input: [
          {role: "user", parts: [{type: "text", content: "c stays"}]},
          {role: "user", parts: [{type: "text", content: "newest"}]}
        ],
        output: nil
      },
      truncated: true,
      size: 124
    },
    output_parts_go_from_the_start_and_reasoning_goes_whole: {
      bound: 183,
      system: [{type: "text", content: "sys"}],
      input: [{role: "user", parts: [{type: "text", content: "question #{'q' * 20}"}]}],
      output: [
        {
          role: "assistant",
          parts: [
            {type: "reasoning", content: "think-#{'t' * 50}"},
            {type: "text", content: "final answer"}
          ]
        }
      ],
      expected: {
        system: [],
        input: [{role: "user", parts: []}],
        output: [{role: "assistant", parts: [{type: "text", content: "final answer"}]}]
      },
      truncated: true,
      size: 103
    },
    last_remaining_text_part_is_cut_from_its_end: {
      bound: 126,
      system: [{type: "text", content: "sys"}],
      input: [{role: "user", parts: [{type: "text", content: "question"}]}],
      output: [
        {
          role: "assistant",
          parts: [
            {type: "tool_call", id: "toolu_1", name: "get_weather", arguments: {city: "Paris"}},
            {type: "text", content: "0123456789" * 6}
          ]
        }
      ],
      expected: {
        system: [],
        input: [{role: "user", parts: []}],
        output: [
          {role: "assistant", parts: [{type: "text", content: "01234567890123456789012345678901234"}]}
        ]
      },
      truncated: true,
      size: 126
    },
    cut_counts_the_serialized_escapes: {
      bound: 133,
      system: nil,
      input: [{role: "user", parts: [{type: "text", content: "say \"hi\"\n" * 8}]}],
      output: nil,
      expected: {
        system: nil,
        input: [
          {
            role: "user",
            parts: [
              {
                type: "text",
                content: "say \"hi\"\nsay \"hi\"\nsay \"hi\"\nsay \"hi\"\nsay \"hi\"\nsay \"hi\"\nsay "
              }
            ]
          }
        ],
        output: nil
      },
      truncated: true,
      size: 132
    },
    cut_is_at_a_character_boundary: {
      bound: 117,
      system: nil,
      input: nil,
      output: [{role: "assistant", parts: [{type: "text", content: "a€😀é" * 6}]}],
      expected: {
        system: nil,
        input: nil,
        output: [{role: "assistant", parts: [{type: "text", content: "#{'a€😀é' * 5}a€"}]}]
      },
      truncated: true,
      size: 115
    },
    last_remaining_part_that_is_not_text_is_removed_whole: {
      bound: 120,
      system: [{type: "text", content: "sys"}],
      input: [{role: "user", parts: [{type: "text", content: "question"}]}],
      output: [
        {
          role: "assistant",
          parts: [
            {type: "tool_call", id: "toolu_1", name: "write_file", arguments: {path: "a.txt", text: "w" * 80}}
          ]
        }
      ],
      expected: {
        system: [],
        input: [{role: "user", parts: []}],
        output: [{role: "assistant", parts: []}]
      },
      truncated: true,
      size: 63
    },
    last_remaining_reasoning_part_is_removed_whole: {
      bound: 110,
      system: nil,
      input: [{role: "user", parts: [{type: "text", content: "q"}]}],
      output: [{role: "assistant", parts: [{type: "reasoning", content: "r" * 100}]}],
      expected: {
        system: nil,
        input: [{role: "user", parts: []}],
        output: [{role: "assistant", parts: []}]
      },
      truncated: true,
      size: 61
    },
    stop_sequences_alone_over_the_bound_are_removed_whole_then_parts: {
      bound: 100,
      stop_sequences: ["STOP-#{'x' * 100}"],
      system: [{type: "text", content: "sys"}],
      input: [{role: "user", parts: [{type: "text", content: "question"}]}],
      output: [
        {role: "assistant", parts: [{type: "tool_call", id: "toolu_1", name: "f", arguments: {}}]}
      ],
      expected: {
        stop_sequences: nil,
        system: [],
        input: [{role: "user", parts: []}],
        output: [{role: "assistant", parts: []}]
      },
      truncated: true,
      size: 63
    },
    stop_sequences_alone_over_the_bound_are_removed_whole: {
      bound: 100,
      stop_sequences: ["STOP-#{'x' * 100}"],
      system: nil,
      input: [{role: "user", parts: []}],
      output: nil,
      expected: {
        stop_sequences: nil,
        system: nil,
        input: [{role: "user", parts: []}],
        output: nil
      },
      truncated: true,
      size: 28
    },
    kept_structure_alone_over_a_tiny_bound_is_exported_as_it_is: {
      bound: 10,
      system: [{type: "text", content: "sys"}],
      input: [{role: "user", parts: [{type: "text", content: "question"}]}],
      output: [
        {role: "assistant", parts: [{type: "tool_call", id: "toolu_1", name: "f", arguments: {}}]}
      ],
      expected: {
        system: [],
        input: [{role: "user", parts: []}],
        output: [{role: "assistant", parts: []}]
      },
      truncated: true,
      size: 63
    },
    multibyte_text_is_measured_in_utf8_bytes: {
      bound: 100,
      system: nil,
      input: [{role: "user", parts: [{type: "text", content: "é" * 30}]}],
      output: nil,
      expected: {
        system: nil,
        input: [{role: "user", parts: [{type: "text", content: "é" * 22}]}],
        output: nil
      },
      truncated: true,
      size: 100
    },
    cut_lands_on_a_whole_character_in_multibyte_text: {
      bound: 100,
      system: nil,
      input: [
        {
          role: "user",
          parts: [
            {
              type: "text",
              content: "cost 5€ 😀 cost 5€ 😀 total: 10€😀 thanks, see you again next week! Bye for now."
            }
          ]
        }
      ],
      output: nil,
      expected: {
        system: nil,
        input: [{role: "user", parts: [{type: "text", content: "cost 5€ 😀 cost 5€ 😀 total: 10€"}]}],
        output: nil
      },
      truncated: true,
      size: 98
    }
  }.freeze

  SIZE_BOUND_CASES.each do |name, shared|
    define_method(:"test_size_bound_#{name}") do
      content = shared.slice(:system, :input, :output, :stop_sequences)
      before = Marshal.load(Marshal.dump(content))
      span = fitted_span(shared[:bound], **content)

      # An absent attribute stays absent, the stop sequences are whole or left out, and the span is
      # marked only when it lost content.
      expected = shared[:expected].except(:stop_sequences).compact.to_h do
        [CONTENT_ATTRIBUTES.fetch(_1), JSON.generate(_2)]
      end
      stop_sequences = shared[:expected][:stop_sequences]
      expected["gen_ai.request.stop_sequences"] = stop_sequences unless stop_sequences.nil?
      expected[TRUNCATED] = true if shared[:truncated]
      assert_equal(expected, span.attributes)
      assert_equal(shared[:size], span.attributes.values.flatten.grep(String).sum(&:bytesize))
      # The caller's lists are as they were.
      assert_equal(before, content)
    end
  end

  def test_the_last_text_part_stays_with_empty_content_when_none_of_its_content_fits
    # The message around the part alone exceeds the bound, so not even an empty text fits.
    span = fitted_span(10, input: [{role: "user", parts: [{type: "text", content: "question"}]}])

    assert_equal(
      '[{"role":"user","parts":[{"type":"text","content":""}]}]',
      span.attributes["gen_ai.input.messages"]
    )
    assert_equal(true, span.attributes[TRUNCATED])
  end

  def test_a_last_text_part_that_has_no_content_to_lose_is_not_marked
    input = [{role: "user", parts: [{type: "text", content: ""}]}]
    span = fitted_span(10, input: input)

    assert_equal(JSON.generate(input), span.attributes["gen_ai.input.messages"])
    refute_includes(span.attributes.keys, TRUNCATED)
  end

  def test_every_output_message_loses_its_parts_the_first_message_first
    text = ->(content) { {type: "text", content: content} }
    output = [
      {role: "assistant", parts: [text.call("a" * 50), text.call("b" * 50)]},
      {role: "assistant", parts: [text.call("c" * 50)]},
      {role: "assistant", parts: [text.call("d" * 50)]}
    ]
    whole = JSON.generate(output).bytesize
    each = JSON.generate(text.call("a" * 50)).bytesize

    one_short = fitted_span(whole - 1, output: output)
    assert_equal(
      JSON.generate([{role: "assistant", parts: [text.call("b" * 50)]}, *output.drop(1)]),
      one_short.attributes["gen_ai.output.messages"]
    )
    # The second part is the last of its message and has no comma after it, so the first two are
    # `(2 * each) + 1` bytes, and one byte more takes the third.
    emptied = {role: "assistant", parts: []}
    last_left = fitted_span(whole - (2 * each) - 2, output: output)
    assert_equal(
      JSON.generate([emptied, emptied, output.last]),
      last_left.attributes["gen_ai.output.messages"]
    )
    cut = fitted_span(whole - (3 * each) - 1 - 10, output: output)
    assert_equal(
      JSON.generate([emptied, emptied, {role: "assistant", parts: [text.call("d" * 40)]}]),
      cut.attributes["gen_ai.output.messages"]
    )
    assert_equal([true] * 3, spans.map { _1.attributes[TRUNCATED] })
  end

  def test_parts_go_whole_from_the_start_each_with_the_comma_after_it
    parts = %w[a b c].map { {type: "text", content: _1 * 100} }
    each = JSON.generate(parts.first).bytesize
    remove = lambda do |excess|
      lists = [parts.dup]
      [Tracing.truncate_parts(lists, excess), lists.first]
    end

    assert_equal([false, parts], remove.call(0))
    assert_equal([true, parts.drop(1)], remove.call(1))
    assert_equal([true, parts.drop(1)], remove.call(each + 1))
    assert_equal([true, parts.drop(2)], remove.call(each + 2))
    assert_equal([true, parts.drop(2)], remove.call(2 * (each + 1)))
    # One part is left, a text: it loses its end, and stays when none of it is left.
    assert_equal([true, [{type: "text", content: "c" * 99}]], remove.call((2 * (each + 1)) + 1))
    assert_equal([true, [{type: "text", content: ""}]], remove.call(1_000_000))
    assert_equal(false, Tracing.truncate_parts([[], []], 1_000_000))
  end

  def test_a_cut_text_is_the_longest_start_of_whole_characters_whose_json_fits
    # The last one has backslashes before a `u`, which are not the escape of a control character.
    ["日本語🙂é", "a\n\"\\\u0001🙂", "\\\\u00\u0001é\\"].each do |text|
      part = {type: "text", content: text * 20}
      whole = JSON.generate(part).bytesize
      (1...whole).each do |excess|
        lists = [[part]]

        assert(Tracing.truncate_parts(lists, excess))
        # The part stays, also when not even its empty text fits.
        cut = lists.first.first[:content]
        assert_predicate(cut, :valid_encoding?)
        assert(part[:content].start_with?(cut))
        assert(cut.empty? || JSON.generate(lists.first.first).bytesize <= whole - excess)
        longer = part[:content][0, cut.length + 1]
        assert_operator(JSON.generate({**part, content: longer}).bytesize, :>, whole - excess)
      end
    end
    lists = [[{type: "text", content: "🙂🙂"}]]
    Tracing.truncate_parts(lists, 1)
    assert_equal([[{type: "text", content: "🙂"}]], lists)
  end

  def test_a_part_before_the_last_goes_whole_whatever_its_type_and_the_next_list_follows
    call = {type: "tool_call", id: "toolu_1", name: "get_weather", arguments: {city: "Paris"}}
    text = {type: "text", content: "a" * 100}
    reasoning = {type: "reasoning", content: "r" * 100}
    remove = lambda do |excess, last|
      lists = [[text], [], [call, reasoning], [last]]
      Tracing.truncate_parts(lists, excess)
      lists
    end
    sizes = [text, call, reasoning].map { JSON.generate(_1).bytesize }

    assert_equal([[text], [], [call, reasoning], [text]], remove.call(0, text))
    # One byte over takes the whole text, and nothing of the list after it.
    assert_equal([[], [], [call, reasoning], [text]], remove.call(1, text))
    # The tool call goes with the comma after it, and the reasoning is not cut.
    assert_equal([[], [], [reasoning], [text]], remove.call(sizes[0] + 1, text))
    assert_equal([[], [], [], [text]], remove.call(sizes[0] + sizes[1] + 2, text))
    before_last = sizes.sum + 1
    assert_equal([[], [], [], [{type: "text", content: "a" * 90}]], remove.call(before_last + 10, text))
    # A last part that is not a text goes whole too.
    assert_equal([[], [], [], []], remove.call(before_last + 1, reasoning))
    assert_equal([[], [], [], []], remove.call(before_last + 1, call))
  end
end
# rubocop:enable Lint/EmptyBlock, Lint/UnreachableLoop

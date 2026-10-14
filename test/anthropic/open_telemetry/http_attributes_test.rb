# frozen_string_literal: true

require_relative "support"

class Anthropic::Test::OpenTelemetryHTTPAttributesTest < Anthropic::Test::OpenTelemetryTestCase
  URL_ATTRIBUTES = %w[url.scheme url.path url.query url.full].freeze
  RESEND_COUNT = "http.request.resend_count"
  SERVER_ERROR = {status: 500, body: {type: "error", error: {type: "api_error", message: "x"}}.to_json}.freeze

  def url_attributes(span) = span.attributes.to_h.slice(*URL_ATTRIBUTES)

  def stub_list(url) = stub_request(:get, url).to_return_json(body: {data: [], has_more: false})

  def test_a_span_starts_with_the_method_and_the_route_and_gets_the_url_of_its_first_request
    stub_request(:delete, "#{BASE_URL}/v1/files/file_1?beta=true").to_return_json(body: {id: "file_1"})
    sampler = recording_sampler

    client.beta.files.delete("file_1")

    http = {"http.request.method" => "DELETE", "http.route" => "/v1/files/{file_id}"}
    assert_equal(http, sampler.started.first.last.slice(*http.keys, *URL_ATTRIBUTES))
    assert_equal(http, only_span.attributes.to_h.slice(*http.keys))
    assert_equal(
      {
        "url.scheme" => "http",
        "url.path" => "/v1/files/file_1",
        "url.full" => "http://localhost:4010/v1/files/file_1"
      },
      url_attributes(only_span)
    )
    refute_includes(only_span.attributes, RESEND_COUNT)
  end

  def test_url_full_has_the_port_only_when_the_url_names_one
    stub_messages(url: "https://api.example.com/v1/messages")

    client(base_url: "https://api.example.com").messages.create(**PARAMS)

    assert_equal(
      {
        "url.scheme" => "https",
        "url.path" => "/v1/messages",
        "url.full" => "https://api.example.com/v1/messages"
      },
      url_attributes(only_span)
    )
  end

  def test_url_full_has_a_port_that_the_url_names_even_when_it_is_that_of_the_scheme
    stub_messages(url: "https://api.example.com/v1/messages")

    client(base_url: "https://api.example.com:443").messages.create(**PARAMS)

    assert_equal("https://api.example.com:443/v1/messages", only_span.attributes["url.full"])
    assert_equal(443, only_span.attributes["server.port"])
  end

  def test_no_attribute_has_the_userinfo_of_the_base_url
    stub_messages(url: "https://api.example.com/v1/messages")

    client(base_url: "https://u:p@api.example.com").messages.create(**PARAMS)

    assert_equal("https://api.example.com/v1/messages", only_span.attributes["url.full"])
    assert_equal("api.example.com", only_span.attributes["server.address"])
    assert_empty(only_span.attributes.values.grep(/u:p|@/))
  end

  def test_a_request_that_fails_has_the_url_it_was_sent_to
    not_found = {type: "error", error: {type: "not_found_error", message: "x"}}
    stub_request(:get, "#{MESSAGES_URL}/batches/not%20an%20id")
      .to_return_json(status: 404, body: not_found).then.to_timeout

    c = client(max_retries: 0)
    assert_raises(Anthropic::Errors::NotFoundError) { c.messages.batches.retrieve("not an id") }
    assert_raises(Anthropic::Errors::APITimeoutError) { c.messages.batches.retrieve("not an id") }

    assert_equal(%w[not_found_error client_timeout_error], spans.map { _1.attributes["error.type"] })
    url = {
      "url.scheme" => "http",
      "url.path" => "/v1/messages/batches/not%20an%20id",
      "url.full" => "#{MESSAGES_URL}/batches/not%20an%20id"
    }
    assert_equal([url, url], spans.map { url_attributes(_1) })
  end

  def test_url_query_has_the_parameters_the_endpoint_defines_as_they_were_sent
    stub_list(%r{\A#{BASE_URL}/v1/files\?})

    client.beta.files.list(
      limit: 2,
      ids: ["a b", "c"],
      request_options: {extra_query: {"trace" => "1", "page" => "p 2"}}
    )

    # `beta=true` and `trace` are not parameters of the endpoint. `page` is, whoever set it.
    query = "ids%5B%5D=a+b&ids%5B%5D=c&limit=2&page=p+2"
    assert_equal(query, only_span.attributes["url.query"])
    assert_equal("http://localhost:4010/v1/files?#{query}", only_span.attributes["url.full"])
    assert_equal("/v1/files", only_span.attributes["url.path"])
  end

  # A list call, and the query that its endpoint defines all of.
  LIST_QUERIES = {
    models: [
      ->(c) { c.models.list(lifecycle: [:retired], limit: 2) },
      "lifecycle%5B%5D=retired&limit=2"
    ],
    beta_models: [
      ->(c) { c.beta.models.list(lifecycle: [:retired], limit: 2) },
      "lifecycle%5B%5D=retired&limit=2"
    ],
    workspaces: [
      ->(c) { c.organization.workspaces.list(include_default: true, limit: 2) },
      "include_default=true&limit=2"
    ],
    beta_workspaces: [
      ->(c) { c.beta.organization.workspaces.list(include_default: true, limit: 2) },
      "include_default=true&limit=2"
    ],
    session_threads: [
      ->(c) { c.beta.sessions.threads.list("sesn_1", statuses: [:idle], limit: 2) },
      "limit=2&statuses%5B%5D=idle"
    ]
  }.freeze

  LIST_QUERIES.each do |name, (call, query)|
    define_method(:"test_url_query_has_every_parameter_of_the_#{name}_list") do
      stub_list(/\A#{BASE_URL}/)

      call.call(client)

      assert_equal(query, only_span.attributes["url.query"])
    end
  end

  def test_url_query_takes_a_name_with_a_bracket_only_as_the_endpoint_defines_it
    stub_list(%r{\A#{BASE_URL}/v1/agents\?})

    client.beta.agents.list(
      created_at_gte: Time.utc(2026, 1, 2),
      request_options: {extra_query: {"created_at[between]" => "x", "limits[]" => "1"}}
    )

    # `created_at[gte]` is a parameter of its own, and `created_at` is none.
    assert_equal("created_at%5Bgte%5D=2026-01-02T00%3A00%3A00Z", only_span.attributes["url.query"])
  end

  def test_url_query_has_no_added_parameter_that_starts_with_a_name_the_endpoint_defines
    stub_list(%r{\A#{BASE_URL}/v1/agents\?})
    stub_list(%r{\A#{BASE_URL}/v1/files\?})
    stub_list(%r{\A#{BASE_URL}/v1/organizations/users\?})
    # WebMock takes `limit[x]` for a part of `limit`, so no call here has a `limit` beside it.
    added = {"limit[x]" => "1", "limit[y][z]" => "2", "email[x]" => "a@example.com"}

    client.beta.agents.list(created_at_gte: Time.utc(2026, 1, 2), request_options: {extra_query: added})
    client.beta.files.list(ids: ["a"], request_options: {extra_query: added})
    # This endpoint defines `email`, which is content, and no `email[x]`.
    client.beta.organization.users.list(roles: [:admin], request_options: {extra_query: added})

    assert_requested(:get, /email%5Bx%5D=.*limit%5Bx%5D=1&limit%5By%5D%5Bz%5D=2/, times: 3)
    # Each endpoint defines `limit`. An array is sent as `ids[]`, and `created_at[gte]` is a name as it is.
    queries = %w[created_at%5Bgte%5D=2026-01-02T00%3A00%3A00Z ids%5B%5D=a roles%5B%5D=admin]
    assert_equal(queries, spans.map { _1.attributes["url.query"] })
    paths = %w[/v1/agents /v1/files /v1/organizations/users]
    assert_equal(paths.zip(queries).map { "#{BASE_URL}#{_1}?#{_2}" }, spans.map { _1.attributes["url.full"] })
  end

  # A call whose query has a parameter that is content, with that query as it is sent.
  CONTENT_QUERIES = {
    email: [
      ->(c) { c.beta.organization.users.list(email: "a@example.com", limit: 2) },
      "email=a%40example.com&limit=2"
    ],
    path_prefix: [
      ->(c) { c.beta.memory_stores.memories.list("store_1", path_prefix: "/notes", limit: 2) },
      "limit=2&path_prefix=%2Fnotes"
    ],
    expected_content_sha256: [
      lambda do |c|
        c.beta.memory_stores.memories.delete("mem_1", memory_store_id: "s_1", expected_content_sha256: "a")
      end,
      "expected_content_sha256=a"
    ]
  }.freeze

  CONTENT_QUERIES.each do |name, (call, query)|
    define_method(:"test_a_query_with_#{name}_is_content_and_so_is_the_url_that_has_it") do
      stub_request(:any, /#{BASE_URL}/).to_return_json(body: {id: "mem_1", type: "memory_deleted", data: []})

      call.call(client)
      call.call(content_client)

      metadata_only, content = spans
      path = content.attributes["url.path"]
      assert_equal({"url.scheme" => "http", "url.path" => path}, url_attributes(metadata_only))
      assert_equal(
        {
          "url.scheme" => "http",
          "url.path" => path,
          "url.query" => query,
          "url.full" => "#{BASE_URL}#{path}?#{query}"
        },
        url_attributes(content)
      )
      # Nothing else differs, such as the route and the IDs in the path.
      others = metadata_only.attributes.keys - URL_ATTRIBUTES
      assert_equal(metadata_only.attributes.slice(*others), content.attributes.slice(*others))
      assert_includes(others, "http.route")
    end
  end

  def test_a_query_without_a_parameter_that_is_content_is_in_either_content_mode
    stub_list(%r{\A#{BASE_URL}/v1/organizations/users\?})
    stub_list(%r{\A#{BASE_URL}/v1/files\?})

    [client, content_client].each do |c|
      c.beta.organization.users.list(limit: 2, roles: [:admin])
      # The endpoint defines no `email`, so the one that the application adds is left out as before.
      c.beta.files.list(limit: 2, request_options: {extra_query: {"email" => "x"}})
    end

    queries = ["limit=2&roles%5B%5D=admin", "limit=2"]
    assert_equal(queries * 2, spans.map { _1.attributes["url.query"] })
    urls = ["#{BASE_URL}/v1/organizations/users?#{queries.first}", "#{BASE_URL}/v1/files?limit=2"]
    assert_equal(urls * 2, spans.map { _1.attributes["url.full"] })
  end

  # `filter` matches names on these endpoints, so there its value is content.
  %w[skills plugins connectors].each do |resource|
    define_method(:"test_the_filter_of_the_analytics_#{resource}_list_is_content") do
      path = "/v1/organizations/analytics/#{resource}"
      stub_list(/\A#{BASE_URL}#{path}\?/)

      [client, content_client].each do |c|
        c.beta.organization.analytics.public_send(resource).list(filter: ["skill_name:Quarterly"], limit: 2)
      end

      metadata_only, content = spans
      assert_equal({"url.scheme" => "http", "url.path" => path}, url_attributes(metadata_only))
      refute(metadata_only.attributes.values.any? { _1.to_s.include?("Quarterly") })
      query = "filter%5B%5D=skill_name%3AQuarterly&limit=2"
      assert_equal(
        {"url.scheme" => "http", "url.path" => path, "url.query" => query, "url.full" => "#{BASE_URL}#{path}?#{query}"},
        url_attributes(content)
      )
    end
  end

  def test_the_filter_of_the_analytics_users_list_is_not_content
    path = "/v1/organizations/analytics/users"
    stub_list(/\A#{BASE_URL}#{path}\?/)

    [client, content_client].each do |c|
      c.beta.organization.analytics.users.list(filter: ["rbac_group_id:group_1"], limit: 2)
    end

    query = "filter%5B%5D=rbac_group_id%3Agroup_1&limit=2"
    assert_equal([query] * 2, spans.map { _1.attributes["url.query"] })
    assert_equal(["#{BASE_URL}#{path}?#{query}"] * 2, spans.map { _1.attributes["url.full"] })
  end

  # The `page` cursor of these lists holds a value of the last row, so there it is content.
  PAGE_CONTENT_LISTS = {
    analytics_users: [
      ->(c) { c.beta.organization.analytics.users.list(limit: 2, page: "cursor_1") },
      "/v1/organizations/analytics/users"
    ],
    memories: [
      ->(c) { c.beta.memory_stores.memories.list("store_1", limit: 2, page: "cursor_1") },
      "/v1/memory_stores/store_1/memories"
    ]
  }.freeze

  PAGE_CONTENT_LISTS.each do |name, (call, path)|
    define_method(:"test_the_page_of_the_#{name}_list_is_content") do
      stub_list(/\A#{BASE_URL}#{path}\?/)

      [client, content_client].each { call.call(_1) }

      metadata_only, content = spans
      assert_equal({"url.scheme" => "http", "url.path" => path}, url_attributes(metadata_only))
      refute(metadata_only.attributes.values.any? { _1.to_s.include?("cursor_1") })
      query = "limit=2&page=cursor_1"
      assert_equal(
        {
          "url.scheme" => "http",
          "url.path" => path,
          "url.query" => query,
          "url.full" => "#{BASE_URL}#{path}?#{query}"
        },
        url_attributes(content)
      )
    end
  end

  def test_a_parameter_that_is_always_content_is_content_on_a_method_that_names_none_of_its_own
    stub_list(%r{\A#{BASE_URL}/v1/things\?})
    request = {
      method: :get,
      path: "v1/things",
      query: {"email" => "a@example.com"},
      span_name: "anthropic.things.list",
      span_route: "/v1/things",
      span_query: %w[email]
    }

    [client, content_client].each { _1.request(request) }

    metadata_only, content = spans.map { url_attributes(_1) }
    assert_equal({"url.scheme" => "http", "url.path" => "/v1/things"}, metadata_only)
    assert_equal("email=a%40example.com", content["url.query"])
    assert_equal("#{BASE_URL}/v1/things?email=a%40example.com", content["url.full"])
  end

  def test_an_organization_method_has_a_span_with_its_name_and_route_and_keeps_back_a_query_that_is_content
    stub_list(%r{\A#{BASE_URL}/v1/organizations/users\?})

    [client, content_client].each { _1.organization.users.list(email: "a@example.com", limit: 2) }

    assert_equal(["anthropic.organization.users.list"] * 2, spans.map(&:name))
    assert_equal(["/v1/organizations/users"] * 2, spans.map { _1.attributes["http.route"] })
    metadata_only, content = spans.map { url_attributes(_1) }
    assert_equal({"url.scheme" => "http", "url.path" => "/v1/organizations/users"}, metadata_only)
    query = "email=a%40example.com&limit=2"
    assert_equal(
      {
        "url.scheme" => "http",
        "url.path" => "/v1/organizations/users",
        "url.query" => query,
        "url.full" => "#{BASE_URL}/v1/organizations/users?#{query}"
      },
      content
    )
  end

  def test_a_beta_organization_plugins_method_has_a_span_with_its_route
    stub_request(:get, "#{BASE_URL}/v1/organizations/plugins/plugin_1?beta=true")
      .to_return_json(body: {id: "plugin_1", type: "plugin"})

    client.beta.organization.plugins.retrieve("plugin_1")

    span = only_span("anthropic.organization.plugins.retrieve")
    assert_equal("/v1/organizations/plugins/{plugin_id}", span.attributes["http.route"])
    assert_equal("plugin_1", span.attributes["anthropic.organization.plugin.id"])
    assert_equal("/v1/organizations/plugins/plugin_1", span.attributes["url.path"])
  end

  def test_url_query_is_absent_when_no_parameter_is_left
    stub_messages(url: "#{MESSAGES_URL}?beta=true&trace=1")

    client.beta.messages.create(**PARAMS, request_options: {extra_query: {"trace" => "1"}})

    assert_equal(
      {"url.scheme" => "http", "url.path" => "/v1/messages", "url.full" => MESSAGES_URL},
      url_attributes(only_span)
    )
  end

  def test_the_span_of_a_later_page_has_the_query_of_its_own_request
    url = "#{BASE_URL}/v1/sessions/sess_1/events?beta=true"
    stub_request(:get, url).to_return_json(body: {data: [{id: "listed_1"}], next_page: "p2"})
    stub_request(:get, "#{url}&page=p2").to_return_json(body: {data: [{id: "listed_2"}], next_page: nil})

    assert_equal(2, client.beta.sessions.events.list("sess_1").to_enum.to_a.length)

    assert_equal([nil, "page=p2"], spans.map { _1.attributes["url.query"] })
    assert_equal(["/v1/sessions/{session_id}/events"] * 2, spans.map { _1.attributes["http.route"] })
  end

  def test_a_retried_call_keeps_the_url_of_its_first_request_and_counts_the_resends
    stub_messages(SERVER_ERROR, url: "#{MESSAGES_URL}/attempt_0")
    stub_request(:post, "#{MESSAGES_URL}/attempt_1").to_return(**SERVER_ERROR)
    stub_request(:post, "#{MESSAGES_URL}/attempt_2").to_return_json(body: MESSAGE)
    # A middleware can send each attempt elsewhere.
    retarget = lambda do |req, nxt|
      nxt.call(req.with(url: URI.join(req.url, "/v1/messages/attempt_#{req.retry_count}")))
    end

    client(max_retries: 2, middleware: [retarget]).messages.create(**PARAMS)

    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal("/v1/messages/attempt_0", span.attributes["url.path"])
    assert_equal("http://localhost:4010/v1/messages/attempt_0", span.attributes["url.full"])
    assert_equal(2, span.attributes[RESEND_COUNT])
  end

  def test_the_first_request_is_the_first_that_the_call_sends
    stub_messages(url: "#{MESSAGES_URL}/attempt_1")
    # The first attempt fails before it sends a request.
    unready = lambda do |req, nxt|
      raise Anthropic::Errors::RetryableError if req.retry_count.zero?

      nxt.call(req.with(url: URI.join(req.url, "/v1/messages/attempt_1")))
    end

    client(max_retries: 1, middleware: [unready]).messages.create(**PARAMS)

    assert_equal(1, @requests.length)
    assert_equal("/v1/messages/attempt_1", only_span.attributes["url.path"])
    refute_includes(only_span.attributes, RESEND_COUNT)
  end

  def test_a_call_that_fails_after_its_retries_has_counted_them
    stub_messages(SERVER_ERROR, SERVER_ERROR)

    assert_raises(Anthropic::Errors::InternalServerError) { client(max_retries: 1).messages.create(**PARAMS) }

    assert_equal(ERROR, only_span.status.code)
    assert_equal(1, only_span.attributes[RESEND_COUNT])
  end

  def test_a_middleware_that_sends_the_request_once_more_counts_as_a_resend
    stub_messages
    twice = lambda do |req, nxt|
      nxt.call(req).body.to_a
      nxt.call(req)
    end

    client(middleware: [twice]).messages.create(**PARAMS)

    assert_equal(2, @requests.length)
    assert_equal(1, only_span.attributes[RESEND_COUNT])
    assert_equal(MESSAGES_URL, only_span.attributes["url.full"])
  end

  def test_a_redirect_is_a_resend_and_leaves_the_url_of_the_first_request
    stub_messages({status: 307, body: "", headers: {"location" => "https://example.com/elsewhere?limit=1"}})
    stub_request(:post, "https://example.com/elsewhere?limit=1").to_return_json(body: MESSAGE)

    client.messages.create(**PARAMS)

    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal(
      {"url.scheme" => "http", "url.path" => "/v1/messages", "url.full" => MESSAGES_URL},
      url_attributes(span)
    )
    assert_equal("POST", span.attributes["http.request.method"])
    assert_equal(1, span.attributes[RESEND_COUNT])
  end

  def test_a_retry_of_a_redirected_request_is_one_more_resend
    stub_messages({status: 307, body: "", headers: {"location" => "https://example.com/elsewhere"}})
    stub_request(:post, "https://example.com/elsewhere")
      .to_return(SERVER_ERROR).then.to_return_json(body: MESSAGE)

    client(max_retries: 1).messages.create(**PARAMS)

    assert_equal(OK, only_span.status.code)
    assert_equal(MESSAGES_URL, only_span.attributes["url.full"])
    # The redirect, and the retry of the request that followed it.
    assert_equal(2, only_span.attributes[RESEND_COUNT])
  end

  def test_a_call_that_sends_no_request_has_no_url
    cached = lambda do |req, _nxt|
      Anthropic::APIResponse.new(
        status: 200,
        headers: {"content-type" => "application/json"},
        body: [MESSAGE.to_json],
        request: req
      )
    end

    client(middleware: [cached]).messages.create(**PARAMS)

    assert_equal(OK, only_span.status.code)
    assert_empty(url_attributes(only_span))
    assert_equal("/v1/messages", only_span.attributes["http.route"])
  end

  def test_a_call_that_fails_before_its_request_is_built_has_no_url
    bedrock = Anthropic::BedrockClient.new(
      aws_region: "us-east-1",
      api_key: "k",
      open_telemetry: {tracer_provider: @provider}
    )

    assert_raises(NotImplementedError) do
      bedrock.messages.count_tokens(messages: PARAMS[:messages], model: "m")
    end

    span = only_span("anthropic.messages.count_tokens")
    assert_empty(url_attributes(span))
    assert_equal(
      {"http.request.method" => "POST", "http.route" => "/v1/messages/count_tokens"},
      span.attributes.to_h.slice("http.request.method", "http.route")
    )
  end
end

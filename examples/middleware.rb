#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: false

require_relative "../lib/anthropic"

# A middleware is any `#call(req, nxt) -> Anthropic::APIResponse` callable.
# The chain runs per HTTP attempt, inside the SDK's retry loop.

# 1. The simplest form: an inline lambda. This one logs each attempt.
LOGGER = Logger.new($stderr)

logging = lambda do |req, nxt|
  res = nxt.call(req)
  model = req.body.is_a?(Hash) ? req.body[:model] : nil
  LOGGER.info("#{req.method.to_s.upcase} #{req.url.path} model=#{model} -> #{res.status}")
  res
end

# 2. Any object responding to `#call(req, nxt)` works — useful when the
# middleware needs its own configuration or state.
class AddTeamHeader
  def initialize(team)
    @team = team
  end

  def call(req, nxt)
    nxt.call(req.with(headers: req.headers.merge("x-team" => @team)))
  end
end

# 3. Register middleware at construction; entries run outermost-first.
client = Anthropic::Client.new(middleware: [logging, AddTeamHeader.new("demo")])

message = client.messages.create(
  max_tokens: 1024,
  messages: [{role: :user, content: "Hello, Claude"}],
  model: :"claude-sonnet-5"
)
puts(message.to_json)

# 4. Attach middleware for a single call via `request_options` — the same
# per-request escape hatch as `extra_headers`/`timeout`. Request-level entries
# run innermost (below any client-level middleware).
timer = lambda do |req, nxt|
  start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  res = nxt.call(req)
  warn(format("request took %.3fs", Process.clock_gettime(Process::CLOCK_MONOTONIC) - start))
  res
end

message = client.messages.create(
  max_tokens: 1024,
  messages: [{role: :user, content: "And hello again"}],
  model: :"claude-sonnet-5",
  request_options: {middleware: [timer]}
)
puts(message.to_json)

# 5. `res.parse` decodes the body the way the SDK would — buffered and
# memoized, so the response stays readable for the caller and for any other
# middleware in the chain.
usage = lambda do |req, nxt|
  res = nxt.call(req)
  parsed = res.parse
  warn("usage: #{parsed.usage}") if parsed.respond_to?(:usage)
  res
end

client.messages.create(
  max_tokens: 1024,
  messages: [{role: :user, content: "One more"}],
  model: :"claude-sonnet-5",
  request_options: {middleware: [usage]}
)

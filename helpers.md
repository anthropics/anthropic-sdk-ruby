# Message Helpers

## Streaming Responses

```ruby
stream = anthropic.messages.stream(
  max_tokens: 1024,
  messages: [{role: :user, content: "Say hello there!"}],
  model: :"claude-3-7-sonnet-latest"
)

stream.text.each do |text|
  print(text)
end
puts
```

`client.messages.stream` returns a `MessageStream` which is an `Enumerable` that emits events and accumulates messages.

The HTTP stream will be cancelled when the MessageStream's events are exhausted, or if you call break while consuming the stream. You can also close it prematurely by calling `stream.close`.

See examples of streaming helpers in action in:
- [`examples/messages_stream.rb`](examples/messages_stream.rb) - Basic streaming
- [`examples/messages_stream_advanced.rb`](examples/messages_stream_advanced.rb) - Advanced streaming patterns
- [`examples/thinking_stream.rb`](examples/thinking_stream.rb) - Thinking events streaming
- [`examples/tools_stream.rb`](examples/tools_stream.rb) - Tool use streaming
- [`examples/citations_stream.rb`](examples/citations_stream.rb) - Document citations streaming
- [`examples/text_stream.rb`](examples/text_stream.rb) - Text streaming
- [`examples/web_search_stream.rb`](examples/web_search_stream.rb) - Web search streaming

### Methods

#### `.text`

Iterate over just the text deltas in the stream:

```ruby
stream.text.each do |text|
  print(text)
end
puts
```

#### `.close`

Aborts the request.

#### `.until_done`

Blocks until the stream has been read to completion.

#### `.accumulated_message`

Blocks until the stream has been read to completion and returns the accumulated `Message` object.

#### `.accumulated_text`

Blocks until the stream has been read to completion and returns all `text` content blocks concatenated together.

### Events

The events listed here are just the event types that the SDK extends, for a full list of the events returned by the API, see [these docs](https://docs.anthropic.com/en/api/messages-streaming#event-types).

```ruby
require "anthropic"

stream = anthropic.messages.stream(
  max_tokens: 1024,
  messages: [{role: :user, content: "Say hello there!"}],
  model: :"claude-3-7-sonnet-latest"
)

stream.each do |event|
  case event
  when Anthropic::Streaming::TextEvent
    print(event.text)
  when Anthropic::Streaming::ContentBlockStopEvent
    print("\n\ncontent block finished accumulating #{event.content_block}")
  end
end

puts

# you can still get the final accumulated message outside of
# the context manager, as long as the entire stream was consumed
# inside of the context manager
accumulated = stream.accumulated_message
puts("accumulated message: #{accumulated.to_json}")
```

#### `TextEvent`

This event is yielded whenever a text `content_block_delta` event is returned by the API & includes the delta and the accumulated snapshot, e.g.

```ruby
when Anthropic::Streaming::TextEvent
  event.text  # " there"
  event.snapshot  # "Hello, there"
```

#### `InputJsonEvent`

This event is yielded whenever a JSON `content_block_delta` event is returned by the API & includes the delta and the accumulated snapshot, e.g.

```ruby
when Anthropic::Streaming::InputJsonEvent
    event.partial_json  # ' there"'
    event.snapshot  # '{"message": "Hello, there"'
```

#### `MessageStopEvent`

The event is yielded when a full Message object has been accumulated.

```ruby
when Anthropic::Streaming::MessageStopEvent
    event.message  # Message
```

#### `ContentBlockStopEvent`

The event is yielded when a full ContentBlock object has been accumulated.

```ruby
when Anthropic::Streaming::ContentBlockStopEvent
    event.content_block  # ContentBlock
```

#### `MessageStopEvent`

The event is yielded when a full Message object has been accumulated.

```ruby
when Anthropic::Streaming::MessageStopEvent
    event.message  # Message
```

#### `CitationEvent`

```ruby
when Anthropic::Streaming::ContentBlockStopEvent
    event.citation # Citation
    event.snapshot # Array[Citation] including all of the accumulated citations so far
```

#### `ThinkingEvent`

```ruby
when Anthropic::Streaming::ThinkingEvent
    event.thinking # String
    event.snapshot # The accumulated thinking so far
```

#### `SignatureEvent`

```ruby
when Anthropic::Streaming::SignatureEvent
    event.signature # Signature from a signature_delta event
```

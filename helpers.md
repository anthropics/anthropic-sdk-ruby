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

#### `.headers`

Returns the HTTP response headers from the streaming request. Provides access to rate limit information, request IDs, and other metadata.

#### `.status`

Returns the HTTP status code from the streaming request.

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

# Input Schema Helpers

Input schemas define structured data classes for tools and structured outputs using `Anthropic::BaseModel`.

## Basic Usage

```ruby
class GetWeatherInput < Anthropic::BaseModel
  required :location, String, doc: "The city and state, e.g. San Francisco, CA"
  optional :unit, Anthropic::EnumOf[:celsius, :fahrenheit], doc: "Temperature unit"
end

class GetWeather
  doc "Get the current weather in a given location"

  def call(input) = ...
end
```

## Field Types

- `required :name, Type` - Required field
- `optional :name, Type, doc: "description"` - Optional field
- `required :name, Type, doc: "description", nil?: true` - Required but nullable

## Supported Types

### Basic Types

**`String`** - Text values with optional validation:

```ruby
required :name, String, doc: "User's full name"
required :code, String, min_length: 3, doc: "Airport code (e.g., JFK)"
```

**`Integer`** - Whole numbers:

```ruby
required :age, Integer, doc: "Age in years"
optional :max_stops, Integer, nil?: true
```

**`Float`** - Decimal numbers:

```ruby
required :price, Float, doc: "Price in USD"
required :latitude, Float, doc: "GPS latitude"
```

**`Anthropic::Boolean`** - true/false values:

```ruby
optional :flexible_dates, Anthropic::Boolean
optional :nonstop_only, Anthropic::Boolean, nil?: true
```

### Complex Types

**`Anthropic::EnumOf[:option1, :option2]`** - Limited set of values:

```ruby
required :cabin, Anthropic::EnumOf[:economy, :premium, :business, :first]
required :unit, Anthropic::EnumOf[:celsius, :fahrenheit], nil?: true
```

**`Anthropic::ArrayOf[Type]`** - Arrays of any supported type:

```ruby
required :passengers, Anthropic::ArrayOf[Passenger, nil?: true]
optional :preferred_airlines, Anthropic::ArrayOf[String], nil?: true
required :coordinates, Anthropic::ArrayOf[Float]
```

**`Anthropic::UnionOf[Type1, Type2]`** - Multiple possible types:

```ruby
required :origin, Anthropic::UnionOf[String, Airport]  # Either "JFK" or Airport object
required :value, Anthropic::UnionOf[Integer, String]   # Either 42 or "42"
```

**Nested Models** - Other `Anthropic::BaseModel` subclasses:

```ruby
class Airport < Anthropic::BaseModel
  required :code, String
  required :name, String
end

class FlightSearch < Anthropic::BaseModel
  required :origin, Airport           # Nested object
  optional :alternate, Airport, nil?: true
end
```

### Nullable Fields with `nil?: true`

Add `nil?: true` to make any field accept `nil` values:

```ruby
class Passenger < Anthropic::BaseModel
  required :name, String                                          # Cannot be nil
  required :seat, Anthropic::EnumOf[:window, :aisle], nil?: true  # Can be nil
  optional :bags, Integer, nil?: true                             # Optional AND nullable
end
```

This works with `ArrayOf[...]` as well as `HashOf[...]`

```ruby
Anthropic::ArrayOf[String, nil?: true]
```

You can also use `Anthropic::UnionOf[..., NilClass]` to construct an arbitrary nilable type

```ruby
Anthropic::UnionOf[String, NilClass]
```

**Usage patterns:**

- `required :field, Type` - Must be provided, cannot be nil
- `required :field, Type, nil?: true` - Must be provided, but can be nil
- `optional :field, Type` - May be omitted, cannot be nil if provided
- `optional :field, Type, nil?: true` - May be omitted or be nil

# Tool Use Helpers

Tools let Claude call external functions. There are three approaches:

## 1. Manual Tool Handling

Handle tool calls yourself:

```ruby
message = client.messages.create(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  messages: [user_message],
  tools: [GetWeather.new]
)

if message.stop_reason == :tool_use
  tool = message.content.grep(Anthropic::Models::ToolUseBlock).first
  # Execute your tool logic here
  # Then send tool_result back to continue conversation
end
```

## 2. Streaming Tools

Get tool input as it streams:

```ruby
stream = client.messages.stream(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  tools: [GetWeather.new],
  messages: [...]
)

stream.each do |event|
  case event
  in Anthropic::Streaming::InputJsonEvent
    puts(event.partial_json) # Incremental JSON
    puts(event.snapshot)     # Full JSON so far
  else
  end
end

# Get parsed tool calls
tool_uses = stream.accumulated_message.content.grep(Anthropic::ToolUseBlock)
```

## 3. Auto-Looping Tool Runner (Beta)

Automatically execute tools and continue conversation:

```ruby
class CalculatorInput < Anthropic::BaseModel
  required :lhs, Float
  required :rhs, Float
  required :operator, Anthropic::InputSchema::EnumOf[:+, :-, :*, :/]
end

class Calculator < Anthropic::BaseTool
  doc "i am a calculator and i am good at math"

  # you must specify the input schema to the tool
  input_schema CalculatorInput

  # you can override `#parse` to pre-process the tool call arguments prior to `#call`
  def parse(value) = value

  def call(expr)
    expr.lhs.public_send(expr.operator, expr.rhs)
  end
end

tool = Calculator.new

# Automatically handles tool execution loop
client.beta.messages.tool_runner(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  messages: [{role: "user", content: "What's 15 * 7?"}],
  tools: [tool]
).each_message { puts _1.content }
```

### Tool Runner Methods

#### `#each_message` - Process Messages as They Complete

Process each message after Claude responds. Good for filtering content or triggering actions:

```ruby
runner.each_message do |message|
  text_blocks = message.content.grep_v(Anthropic::Models::Beta::BetaToolUseBlock)
  puts "Claude says: #{text_blocks.first&.text}" unless text_blocks.empty?
end
```

#### `#each_streaming` - Get Real-time Streaming Updates

See text and tool calls as they happen in real-time:

```ruby
runner.each_streaming do |stream|
  stream.each { |event| print(event.text) if event.respond_to?(:text) }
  puts "\nFinal: #{stream.accumulated_text}"
end
```

#### `#next_message` - Manual Step-by-Step Control

Get one message at a time for fine-grained control:

```ruby
loop do
  message = runner.next_message
  break if message.nil?
  # Process message and decide whether to continue
end
```

#### `#feed_messages` - Inject Messages Mid-Conversation

Add your own messages to guide the conversation:

```ruby
runner.each_message do |message|
  if message.content.any? { |block| block.text&.include?("let me") }
    runner.feed_messages({role: :user, content: "Say 'allow me' instead"}, ...)
  end
end
```

#### `#params` - Inject Messages Mid-Conversation

Get the current parameter of the runner. You can inspect `#params` to see what was the previous request parameter that resulted in the current response.

And by modifying `#params`, you can customize the next request parameters as well.

```ruby
runner.each_message do |message|
  puts runner.params

  runner.params.update(max_tokens: 9999)
end
```

#### `#run_until_finished` - Complete and Get All Messages

Let the conversation finish, then process all messages at once:

```ruby
first_msg = runner.next_message
runner.feed_messages({role: :user, content: "Be more confident"}) if needed
all_messages = runner.run_until_finished
```

## Examples

See example files: `examples/tools*.rb` and `examples/auto_looping*.rb`

# Structured Outputs

Structured outputs allow you to constrain Claude's responses to follow a specific JSON schema, making it easier to extract structured data. Use the `output_config` parameter with a `BaseModel` class to define the expected output format.

## Basic Usage

```ruby
class FamousNumber < Anthropic::BaseModel
  required :value, Float
  optional :reason, String, doc: "why is this number mathematically significant?"
end

class Output < Anthropic::BaseModel
  doc "some famous numbers"

  required :numbers, Anthropic::ArrayOf[FamousNumber], min_length: 3, max_length: 5
end

message = anthropic.messages.create(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  messages: [{role: "user", content: "give me some famous numbers"}],
  output_config: {format: Output}
)

# Access the parsed output directly
message.parsed_output
# => #<Output numbers=[#<FamousNumber value=3.14159... reason="Pi is the ratio...">...]>
```

The `output_config` parameter accepts:
- `{format: MyModel}` - Pass a `BaseModel` class directly
- `{format: {type: :json_schema, schema: {...}}}` - Pass a raw JSON schema

## Accessing Parsed Output

When using `output_config`, the response is automatically parsed and validated against your model:

### Using `#parsed_output`

The `Message` object provides a convenience method:

```ruby
message.parsed_output  # Returns the parsed model instance or nil
```

### Using `TextBlock#parsed`

You can also access the parsed content directly from the text block:

```ruby
text_block = message.content.first
text_block.parsed  # Returns the parsed model instance
```

If parsing fails, `parsed` will contain `{error: "error message"}`.

## Streaming Structured Outputs

Structured outputs work with streaming. The parsed output is available after the stream completes:

```ruby
stream = anthropic.messages.stream(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  messages: [{role: "user", content: "give me some famous numbers"}],
  output_config: {format: Output}
)

# Stream the raw text as it arrives
stream.text.each { |text| print(text) }

# Get the parsed output from the accumulated message
stream.accumulated_message.parsed_output
# => #<Output numbers=[...]>
```

## Token Counting

The `count_tokens` method also supports `output_config`:

```ruby
result = anthropic.messages.count_tokens(
  model: "claude-sonnet-4-5-20250929",
  messages: [{role: "user", content: "give me some famous numbers"}],
  output_config: {format: Output}
)
```

## Examples

See example files:
- [`examples/structured_output.rb`](examples/structured_output.rb) - Basic structured output
- [`examples/structured_output_stream.rb`](examples/structured_output_stream.rb) - Streaming structured output

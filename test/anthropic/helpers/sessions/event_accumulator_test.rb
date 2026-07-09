# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Helpers::Sessions::EventAccumulatorTest < Minitest::Test
  def accumulator = Anthropic::Helpers::Sessions::EventAccumulator.new

  def start_event(event_id, preview_type: :"agent.message")
    Anthropic::Beta::BetaManagedAgentsStartEvent.new(
      type: :event_start,
      event: {id: event_id, type: preview_type}
    )
  end

  def delta_event(event_id, text, index: nil)
    delta = {type: :content_delta, content: {type: :text, text: text}}
    delta[:index] = index unless index.nil?
    Anthropic::Beta::BetaManagedAgentsDeltaEvent.new(
      type: :event_delta,
      event_id: event_id,
      delta: delta
    )
  end

  def final_event(event_id, text)
    Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent.new(
      id: event_id,
      type: :"agent.message",
      content: [{type: :text, text: text}],
      processed_at: Time.parse("2024-01-01T00:00:00Z")
    )
  end

  def model_request_end_event
    Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent.new(
      id: "span_1",
      type: :"span.model_request_end",
      processed_at: Time.parse("2024-01-01T00:00:00Z")
    )
  end

  def test_event_start_seeds_an_empty_snapshot
    acc = accumulator
    acc.accumulate(start_event("evt_1"))

    message = acc.agent_messages.fetch("evt_1")
    assert_equal("evt_1", message.id)
    assert_equal(:"agent.message", message.type)
    assert_equal([], message.content)
  end

  def test_event_start_for_a_thinking_preview_seeds_nothing
    acc = accumulator
    acc.accumulate(start_event("evt_1", preview_type: :"agent.thinking"))

    assert_empty(acc.agent_messages)
  end

  def test_new_index_inserts_the_fragment_as_a_fresh_block
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.accumulate(delta_event("evt_1", "Hello", index: 0))

    content = acc.agent_messages.fetch("evt_1").content
    assert_equal(1, content.length)
    assert_equal("Hello", content[0].text)
  end

  def test_existing_text_index_appends
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.accumulate(delta_event("evt_1", "Hel", index: 0))
    acc.accumulate(delta_event("evt_1", "lo", index: 0))
    acc.accumulate(delta_event("evt_1", "World", index: 1))

    content = acc.agent_messages.fetch("evt_1").content
    assert_equal(%w[Hello World], content.map(&:text))
    assert_equal("HelloWorld", acc.agent_message_text("evt_1"))
  end

  def test_defaults_index_to_zero
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.accumulate(delta_event("evt_1", "a"))
    acc.accumulate(delta_event("evt_1", "b"))

    assert_equal("ab", acc.agent_message_text("evt_1"))
    assert_equal(1, acc.agent_messages.fetch("evt_1").content.length)
  end

  def test_raises_on_an_index_gap
    acc = accumulator
    acc.accumulate(start_event("evt_1"))

    error = assert_raises(Anthropic::Helpers::Sessions::EventAccumulator::AccumulationError) do
      acc.accumulate(delta_event("evt_1", "x", index: 2))
    end
    assert_equal("event_delta index 2 is beyond the end of content (length 0)", error.message)
  end

  def test_raises_on_delta_before_start
    error = assert_raises(Anthropic::Helpers::Sessions::EventAccumulator::AccumulationError) do
      accumulator.accumulate(delta_event("evt_1", "x", index: 0))
    end
    assert_equal("event_delta for evt_1 received before its event_start", error.message)
  end

  def test_next_sequential_index_inserts
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.accumulate(delta_event("evt_1", "a", index: 0))
    acc.accumulate(delta_event("evt_1", "b", index: 1))

    assert_equal(%w[a b], acc.agent_messages.fetch("evt_1").content.map(&:text))
  end

  def test_final_agent_message_replaces_the_preview
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.accumulate(delta_event("evt_1", "partial", index: 0))

    final = final_event("evt_1", "complete")
    acc.accumulate(final)

    assert_equal(final, acc.agent_messages.fetch("evt_1"))
    assert_equal("complete", acc.agent_message_text("evt_1"))
  end

  def test_final_agent_message_accepts_an_unknown_id
    acc = accumulator
    acc.accumulate(final_event("evt_1", "complete"))

    assert_equal("complete", acc.agent_message_text("evt_1"))
  end

  def test_unknown_event_types_are_a_no_op
    acc = accumulator
    event = Anthropic::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent.new(
      id: "evt_2",
      type: :"agent.thinking",
      processed_at: Time.parse("2024-01-01T00:00:00Z")
    )
    assert_equal(event, acc.accumulate(event))
    assert_empty(acc.agent_messages)
    assert_nil(acc.agent_message_text("evt_2"))
  end

  def test_model_request_end_discards_open_previews_via_wrap
    acc = accumulator
    events = [
      start_event("evt_1"),
      delta_event("evt_1", "partial", index: 0),
      model_request_end_event
    ]

    seen = acc.wrap(events.each).to_a

    assert_equal(events, seen)
    assert_empty(acc.agent_messages)
    assert_nil(acc.agent_message_text("evt_1"))
  end

  def test_model_request_end_keeps_reconciled_messages
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.accumulate(delta_event("evt_1", "partial", index: 0))
    acc.accumulate(final_event("evt_1", "complete"))
    acc.accumulate(start_event("evt_2"))
    acc.accumulate(delta_event("evt_2", "interrupted", index: 0))
    acc.accumulate(model_request_end_event)

    assert_equal(%w[evt_1], acc.agent_messages.keys)
    assert_equal("complete", acc.agent_message_text("evt_1"))
  end

  def test_multiple_previews_accumulate_independently
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.accumulate(start_event("evt_2"))
    acc.accumulate(delta_event("evt_1", "one", index: 0))
    acc.accumulate(delta_event("evt_2", "two", index: 0))

    assert_equal("one", acc.agent_message_text("evt_1"))
    assert_equal("two", acc.agent_message_text("evt_2"))
  end

  def test_wrap_yields_events_unchanged_and_lazily
    acc = accumulator
    events = [start_event("evt_1"), delta_event("evt_1", "Hel", index: 0), delta_event("evt_1", "lo")]

    enum = acc.wrap(events.each)
    assert_kind_of(Enumerator, enum)
    # Nothing is consumed until the enumerator is driven.
    assert_empty(acc.agent_messages)

    assert_equal(events[0], enum.next)
    assert_equal("", acc.agent_message_text("evt_1"))
    assert_equal(events[1], enum.next)
    assert_equal("Hel", acc.agent_message_text("evt_1"))
    assert_equal(events[2], enum.next)
    assert_equal("Hello", acc.agent_message_text("evt_1"))
  end

  def test_raises_on_a_negative_index
    acc = accumulator
    acc.accumulate(start_event("evt_1"))

    assert_raises(Anthropic::Helpers::Sessions::EventAccumulator::AccumulationError) do
      acc.accumulate(delta_event("evt_1", "x", index: -1))
    end
  end

  def test_straggler_delta_after_the_final_event_is_dropped
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.accumulate(delta_event("evt_1", "partial", index: 0))
    acc.accumulate(final_event("evt_1", "complete"))
    acc.accumulate(delta_event("evt_1", "straggler", index: 0))

    assert_equal("complete", acc.agent_message_text("evt_1"))
  end

  def test_appending_does_not_mutate_the_wire_delta
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    wire = delta_event("evt_1", "x", index: 0)
    acc.accumulate(wire)
    acc.accumulate(delta_event("evt_1", "y", index: 0))

    assert_equal("x", wire.delta.content.text)
    assert_equal("xy", acc.agent_message_text("evt_1"))
  end

  def test_wrap_is_fused_and_never_folds_twice
    acc = accumulator
    events = [start_event("evt_1"), delta_event("evt_1", "Hel", index: 0), delta_event("evt_1", "lo")]

    wrapped = acc.wrap(events)
    assert_equal(events, wrapped.to_a)
    assert_equal("Hello", acc.agent_message_text("evt_1"))

    # Fused: a second pass yields nothing and folds nothing.
    assert_equal([], wrapped.to_a)
    assert_equal("Hello", acc.agent_message_text("evt_1"))
  end

  def test_externally_deleted_snapshot_raises_accumulation_error
    acc = accumulator
    acc.accumulate(start_event("evt_1"))
    acc.agent_messages.delete("evt_1")

    error = assert_raises(Anthropic::Helpers::Sessions::EventAccumulator::AccumulationError) do
      acc.accumulate(delta_event("evt_1", "x", index: 0))
    end
    assert_equal("event_delta for evt_1 received before its event_start", error.message)
  end
end

# frozen_string_literal: true

require "open3"
require "tempfile"

require_relative "test_helper"

class Anthropic::Test::FilePartTest < Minitest::Test
  def test_to_json
    text = "gray"
    filepart = Anthropic::FilePart.new(StringIO.new(text))

    assert_equal(text.to_json, filepart.to_json)
    assert_equal(text.to_yaml, filepart.to_yaml)
  end

  def test_to_yaml_in_a_program_that_only_requires_the_gem
    program = <<~RUBY
      print(Anthropic::FilePart.new("gray").to_yaml)
    RUBY

    yaml, err = Open3.capture3(RbConfig.ruby, "-r./lib/anthropic", "-e", program)

    assert_equal("gray".to_yaml, yaml, err)
  end

  def encode(value)
    state = {can_retry: true}
    dumped = Anthropic::Internal::Type::Converter.dump(
      Anthropic::Internal::Type::FileInput,
      value,
      state: state
    )
    _, encoded = Anthropic::Internal::Util.encode_content({"content-type" => "multipart/form-data"}, dumped)
    [encoded.to_a.join, state]
  end

  def test_tempfile_uploads_the_file_it_wraps
    Tempfile.open("upload") do |tempfile|
      tempfile.write("gray")
      tempfile.rewind

      body, state = encode(tempfile)

      assert_includes(body, "filename=\"#{File.basename(tempfile.path)}\"")
      assert_includes(body, "Content-Type: application/octet-stream\r\n\r\ngray\r\n")
      refute(state.fetch(:can_retry))
    end
  end

  def test_file_part_around_a_tempfile_keeps_its_name_and_type
    Tempfile.open("upload") do |tempfile|
      tempfile.write("gray")
      tempfile.rewind
      part = Anthropic::FilePart.new(tempfile, filename: "gray.txt", content_type: "text/plain")

      body, state = encode(part)

      assert_includes(body, "filename=\"gray.txt\"")
      assert_includes(body, "Content-Type: text/plain\r\n\r\ngray\r\n")
      refute(state.fetch(:can_retry))
    end
  end
end

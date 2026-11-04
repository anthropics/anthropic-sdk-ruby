# frozen_string_literal: true

require "open3"

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
end

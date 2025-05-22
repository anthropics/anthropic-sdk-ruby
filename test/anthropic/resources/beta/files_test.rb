# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::FilesTest < Anthropic::Test::ResourceTest
  def test_list
    response = @anthropic.beta.files.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::FileMetadata
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        filename: String,
        mime_type: String,
        size_bytes: Integer,
        type: Symbol,
        downloadable: Anthropic::Internal::Type::Boolean | nil
      }
    end
  end

  def test_delete
    response = @anthropic.beta.files.delete("file_id")

    assert_pattern do
      response => Anthropic::Beta::DeletedFile
    end

    assert_pattern do
      response => {
        id: String,
        type: Anthropic::Beta::DeletedFile::Type | nil
      }
    end
  end

  def test_download
    skip("skipped: test server currently has no support for method content-type")

    response = @anthropic.beta.files.download("file_id")

    assert_pattern do
      response => StringIO
    end
  end

  def test_retrieve_metadata
    response = @anthropic.beta.files.retrieve_metadata("file_id")

    assert_pattern do
      response => Anthropic::Beta::FileMetadata
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        filename: String,
        mime_type: String,
        size_bytes: Integer,
        type: Symbol,
        downloadable: Anthropic::Internal::Type::Boolean | nil
      }
    end
  end

  def test_upload_required_params
    response = @anthropic.beta.files.upload(file: Pathname(__FILE__))

    assert_pattern do
      response => Anthropic::Beta::FileMetadata
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        filename: String,
        mime_type: String,
        size_bytes: Integer,
        type: Symbol,
        downloadable: Anthropic::Internal::Type::Boolean | nil
      }
    end
  end
end

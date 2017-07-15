require "test_helper"

class JekyllRevealGenerator::CliTest < Minitest::Test

  def setup
    @cli = JekyllRevealGenerator::Cli.new
  end

  def teardown

  end

  def test_slide_slug_returns_a_useful_slug
    options = RecursiveOpenStruct.new(
      group: "1",
      sequence: "2",
      title: "A Clear and Present Danger",
      format: "markdown"
      )
    expected_slug = "01-02-a-clear-and-present-danger.markdown"
    actual_slug = @cli.send(:slide_slug, options)

    assert_equal(expected_slug, actual_slug)
  end

  def test_slide_slug_with_a_more_complicated_title
    options = RecursiveOpenStruct.new(
      group: "1",
      sequence: "2",
      title: "Wazzit: How 'Bout Them $$$$?!?!",
      format: "markdown"
      )
    expected_slug = "01-02-wazzit-how-bout-them-.markdown"
    actual_slug = @cli.send(:slide_slug, options)

    assert_equal(expected_slug, actual_slug)
  end



end

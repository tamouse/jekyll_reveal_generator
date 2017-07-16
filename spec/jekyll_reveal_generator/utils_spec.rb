require "spec_helper"
require "jekyll_reveal_generator/utils"
require "recursive-open-struct"

module JekyllRevealGenerator
  class DummyTestClass
    include JekyllRevealGenerator::Utils
  end
end

RSpec.describe JekyllRevealGenerator::DummyTestClass do

  describe "#slide_slug" do
    let(:options) do
      RecursiveOpenStruct.new(
        group: 0,
        sequence: 1,
        format: 'html'
        )
    end

    context "easy title" do
      it "returns the expected slug" do
        options.title = "A Clear and Present Danger"
        expected = "00-01-a-clear-and-present-danger.html"
        actual = subject.slide_slug(options)
        expect(actual).to eq(expected)
      end

    end
  end

end

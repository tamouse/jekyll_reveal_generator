require "spec_helper"
require "jekyll_reveal_generator/utils"
require "recursive-open-struct"
require "faker"

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
        expected = "00-01-a-clear-and-present-danger"
        actual = subject.slide_slug(options)
        expect(actual).to eq(expected)
      end
    end
    context "difficult title" do
      it "returns the expected slug" do
        options.title = "LINK: This should pay $$$ ?!?!? "
        expected = "00-01-link-this-should-pay"
        actual = subject.slide_slug(options)
        expect(actual).to eq(expected)
      end
    end
  end


  describe "extraction methods" do
    let(:slide_files) do
      [
        '00-01-test.html',
        '00-00-test.html',
        '01-00-test.html',
        '01-99-test.html',
        '07-00-test-html',
        '02-00-test-html',
        '00-10-test.html'
      ]
    end

    it "returns the group number" do
      expect(subject.group_num(slide_files.first)).to eq(0)
    end
    it "returns the sequence number" do
      expect(subject.sequence_num(slide_files.last)).to eq(10)
    end
    it "returns the last group number" do
      expect(subject.last_slide_group(slide_files)).to eq(7)
    end
    it "returns the last sequence number in group 0" do
      expect(subject.last_slide_sequence(0, slide_files)).to eq(10)
    end
    it "returns -1 when the group number is non-existant" do
      expect(subject.last_slide_sequence(99, slide_files)).to eq(-1)
    end
  end




  describe "file system methods" do

    around(:each) do |example|
      run_in_tempdir do |dir|
        slides_dir = dir.join("source", "_slides")
        slides_dir.mkpath
        1.upto(3) do |group|
          1.upto(2) do |sequence|
            opts = RecursiveOpenStruct.new(
              group: group,
              sequence: sequence,
              title: Faker::Book.title,
              format: ['html', 'markdown'].sample
              )
            opts.slug = subject.slide_slug(opts)
            File.write(slides_dir.join(opts.slug), Faker::Lorem.paragraphs(4).join("\n\n"))
          end
        end

        example.run

      end
    end # around(:each)

    it "returns 6 slides" do
      expect(subject.slide_files.count).to eq(6)
    end

    it "last group number is 3" do
      expect(subject.last_slide_group).to eq(3)
    end

    it "last sequence number for group 1 is 2" do
      expect(subject.last_slide_sequence(2)).to eq(2)
    end

  end
end

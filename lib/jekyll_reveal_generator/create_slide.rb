require "recursive-open-struct"
require "yaml"
require "thor"
require "jekyll_reveal_generator/utils"

module JekyllRevealGenerator
  class CreateSlide < Thor::Group
    include Thor::Actions
    include JekyllRevealGenerator::Utils

    add_runtime_options!

    desc "Creates a new slide"

    attr_accessor :slide_options

    def slide
      self.slide_options = RecursiveOpenStruct.new({
          title: '',
          group: 0,
          sequence: 0,
          slug: '',
          format: 'html',
          style: 'standard'
        }
          .merge(options))

      self.slide_options.group = ask("Group?", default: last_slide_group)
      self.slide_options.sequence = ask("Sequence?", default: last_slide_sequence(slide_options.group))
      self.slide_options.title = ask("Title of slide?")
      self.slide_options.slug = ask("Slide slug?", default: slide_slug(slide_options))
      self.slide_options.format = ask("Format?", limit_to: ['html', 'markdown'], default: slide_options.format)
      self.slide_options.style = ask("Slide style?",
        limit_to: [
          'blank',
          'bullet',
          'image_left',
          'image_right',
          'multi',
          'standard',
          'title',
          'two_up'
        ],
        default: 'standard')
      $logger.debug("Slide Options: \n#{slide_options.to_h.to_yaml}")
    end

    def self.source_root
      File.expand_path("../../../templates/slides", __FILE__)
    end

  end

end

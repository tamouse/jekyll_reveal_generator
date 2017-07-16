require "recursive-open-struct"
require "yaml"
require "thor"
require "jekyll_reveal_generator/utils"
require "pathname"

module JekyllRevealGenerator
  class CreateSlide < Thor::Group
    include Thor::Actions
    include JekyllRevealGenerator::Utils

    SLIDE_STYLES = [
      'blank',
      'bullet',
      'image_left',
      'image_right',
      'multi',
      'standard',
      'title',
      'two_up'
    ]

    SLIDE_FORMATS = ['html', 'markdown']


    add_runtime_options!

    class_option(:working_dir, default: Pathname.pwd,
      desc: "Working Directory; root of presentation",
      type: :string, aliases: ['--WD'])

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

      self.slide_options.working_dir = Pathname.new(slide_options.working_dir)

      Dir.chdir(slide_options.working_dir) do |wd|
        self.slide_options.group = ask("Group?", default: last_slide_group).to_i
        $logger.debug("slide_options.group: #{slide_options.group}")
        self.slide_options.sequence = ask("Sequence?", default: last_slide_sequence(slide_options.group) + 1).to_i
      end

      self.slide_options.title = ask("Title of slide?")
      self.slide_options.slug = ask("Slide slug?", default: slide_slug(slide_options))
      self.slide_options.format = ask("Format? [#{SLIDE_FORMATS.join(", ")}]", limit_to: SLIDE_FORMATS, default: slide_options.format)
      self.slide_options.style = ask("Slide style? [#{SLIDE_STYLES.join(", ")}]",
        limit_to: SLIDE_STYLES,
        default: 'standard')
      $logger.debug("Slide Options: \n#{slide_options.to_h.to_yaml}")
    end

    def self.source_root
      File.expand_path("../../../templates/slides", __FILE__)
    end

    def create_slide
      source="#{slide_options.style}_slide.#{slide_options.format}"
      $logger.debug("template_file: #{source}")
      target_file="#{slide_options.slug}.#{slide_options.format}"
      $logger.debug("target_file: #{target_file}")
      destination=slide_options.working_dir.join("source", "_slides", target_file)
      $logger.debug("destination: #{destination}")
      template(source, destination)
    end


  end

end

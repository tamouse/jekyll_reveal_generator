require "pathname"

module JekyllRevealGenerator

  module Utils

    def slide_slug(o)
      pattern = "%02d-%02d-%s.%s"
      pattern % [
        o.group.to_i,
        o.sequence.to_i,
        o.title.downcase.gsub(/[^[:alnum:]]+/,'-'),
        o.format
      ]
    end

    def group_num(file)
      file.to_s.split("-")[0].to_i
    end

    def sequence_num(file)
      file.to_s.split("-")[1].to_i
    end

    def last_slide_group
      slide_files
        .map{|file| group_num(file) }
        .uniq.sort.last
    end

    def last_slide_sequence(group)
      slide_files
        .reject{|file| group != group_num(file) }
        .map{|file| sequence_num(file)}
        .uniq.sort.last
    end

    def slides
      @slides ||= source.join(source, '_slides')
    end

    def slide_files
      @slide_files ||= slides.children
    end

    def source
      @source ||= root_dir.expand_path('../source')
    end

    def root_dir(dir=nil)
      @root_dir ||= (dir ? Pathname.new(dir) : Pathname.pwd)
    end

  end                                   # module Utils
end

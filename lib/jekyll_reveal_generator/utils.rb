require "pathname"

module JekyllRevealGenerator

  module Utils

    def slide_slug(o)
      pattern = "%02d-%02d-%s"
      pattern % [
        o.group.to_i,
        o.sequence.to_i,
        o.title.downcase
          .gsub(/[^[:alnum:]]+/,'-')
          .sub(/-+\z/,'')
      ]
    end

    def group_num(file)
      file.to_s.split("-")[0].to_i
    end

    def sequence_num(file)
      file.to_s.split("-")[1].to_i
    end

    def last_slide_group(files=nil)
      files ||= slide_files
      files
        .map{|file| group_num(file) }
        .uniq.sort.last
    end

    def last_slide_sequence(group, files=nil)
      files ||= slide_files
      files
        .reject{|file| group != group_num(file) }
        .map{|file| sequence_num(file)}
        .uniq.sort.last || -1
    end

    def slides
      @slides ||= source.join(source, '_slides')
    end

    def slide_files
      @slide_files ||= slides.children
        .map{|f| f.basename}
    end

    def source
      @source ||= root_dir.join("source")
    end

    def root_dir(dir=nil)
      @root_dir ||= (dir ? Pathname.new(dir) : Pathname.pwd)
    end

  end                                   # module Utils
end

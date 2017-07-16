require "pathname"
require "tempfile"
require "tmpdir"

def run_in_tempdir(&block)

  Dir.mktmpdir do |tmpdir|
    Dir.chdir(tmpdir) do |dir|
      yield Pathname.new(dir)
    end
  end

end

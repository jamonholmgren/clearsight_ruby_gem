module Clearsight
  class Middleman
    include Methadone::SH

    attr_accessor :args

    def initialize(args)
      @args = args
    end

    def run
      if @args.first == "new"
        create @args[1]
      else
        pass
      end
    end

    def pass
      sh "middleman #{@args.join(' ')}"
    end

    def setup
      File.exist?("#{ENV['HOME']}/.middleman/clearsight") ? update : clone
    end

    def clone
      print "Cloning ClearSight middleman template..."
      sh "git clone git@bitbucket.org/clearsightstudio/middleman-template.git ~/.middleman/clearsight"
      puts "done."
    end

    def update
      print "Updating ClearSight middleman template..."
      sh "cd ~/.middleman/clearsight && git pull"
      puts "done."
    end

    def create(project)
      setup
      print "Setting up new middleman project..."
      sh "middleman init -T=clearsight #{project}"
      puts "done."
    end
  end
end

module Clearsight
  class Deploy
    include Methadone::SH

    def self.deploy(args)
      puts "Deploying...actually, not, because it's not set up yet. :/"
      puts "ARGS: #{args.join(", ")}"
    end
  end
end

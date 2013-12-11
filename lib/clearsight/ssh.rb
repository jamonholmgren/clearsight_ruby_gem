module Clearsight
  class SSH
    include Methadone::CLILogging
    include Methadone::SH

    def initialize(host)
      @host = host
    end
    
    def sshify(keyname)
      sh "cat ~/.ssh/#{keyname} | ssh #{@host} 'mkdir -p ~/.ssh; touch ~/.ssh/authorized_keys; chmod 744 ~/.ssh; chmod 644 ~/.ssh/authorized_keys; cat >> ~/.ssh/authorized_keys'"
      # sh "ssh-copy-id -i ~/.ssh/#{keyname} #{@host}"
    end

  end
end
Clearsight::Ssh = Clearsight::SSH

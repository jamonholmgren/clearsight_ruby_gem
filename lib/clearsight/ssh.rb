module Clearsight
  class SSH

    def initialize(host)
      @host = host
    end
    
    def sshify(keyname)
      # sh "cat ~/.ssh/#{keyname} | ssh #{host} 'cat >> ~/.ssh/authorized_keys'"
      sh "ssh-copy-id -i ~/.ssh/#{keyname} #{@host}"
    end

  end
end
Clearsight::Ssh = Clearsight::SSH

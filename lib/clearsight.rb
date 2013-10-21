require "clearsight/version"
require "clearsight/deploy"
require 'thread'

module Clearsight
  class Timer
    def initialize(interval, &handler)
      @run = true
      @semaphore = Mutex.new

      @th = Thread.new do
        t = Time.now
        while run?
          t += interval
          (sleep(t - Time.now) rescue nil) and handler.call rescue nil
        end
      end
    end

    def stop
      @semaphore.synchronize do
        @run = false
      end
      @th.join
    end

    private

    def run?
      @semaphore.synchronize do
        @run
      end
    end
  end
end
::CS = ::Clearsight

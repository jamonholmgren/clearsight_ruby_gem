# fix-xcode
#   Mark Rickert <mjar81@gmail.com>

# Symlinks all your old SDKs to Xcode.app every time it is updated.
# Create a directory called /SDKs and run this script.
#
# Each time you upgrade Xcode, run fix-xcode.

# NOTE FROM JAMON: run `cs symlink_xcode_sdks` instead.

module Clearsight
  class Xcode
    def initialize(args)
      @args = args
    end

    def run
      if @args.count == 2
        if @args[0] == "remove"
          abort "Please pass another parameter specifying what SDK to remove." unless @args[1]
          run_remove_sdk "#{@args[1]}"
        end
      else
        run_fix
      end
    end

    def run_fix
      display_banner

      require 'FileUtils'

      # Find all the SDKs in Xcode.app that aren't symlinks.
      Dir.glob("#{xcode_path}/Platforms/*.platform/Developer/SDKs/*.sdk") do |sdk|
        basename = sdk.split('/').last
        if File.symlink?(sdk)
          puts "#{basename} is already symlinked... skipping.\n"
          next
        end

        puts "Processing: #{basename}\n"

        # Remove the old version if it exists
        destination = "#{sdk_path}/#{basename}"
        if File.directory?(destination)
          puts " - Removing existing SDK: #{destination}.\n"
          FileUtils.rm_rf destination
        end

        puts " - Moving the Xcode version into place in #{sdk_path}.\n"
        FileUtils.mv sdk, sdk_path
      end

      Dir.glob("#{sdk_path}/*.sdk") do |sdk|
        sdk_name = sdk.split("/").last
        sdk_platform = sdk_name.match(/[a-zA-Z]{3,}/)[0]

        ln_dest = "#{xcode_path}/Platforms/#{sdk_platform}.platform/Developer/SDKs/#{sdk_name}"
        puts " - Symlinking #{sdk_platform}.\n"

        FileUtils.ln_sf sdk, ln_dest
      end

      puts "\nDone! Your SDKs now live in #{sdk_path} and are symlinked properly into the Xcode.app.\n\n"
    end

    def xcode_path
      `xcode-select --print-path`.chomp
    end

    def sdk_path
      "/SDKs"
    end

    def run_remove_sdk(version)
      # Remove the iOS SDK from xcode.
      version = version.to_s << ".0" if version.to_s.length == 1

      puts "-" * 29
      puts "Removing the iOS #{version} SDK from the Xcode Bundle."
      puts "-" * 29

      removing = "#{xcode_path}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS#{version}.sdk"
      if File.exist? removing
        FileUtils.rm_rf removing
        puts "SDK successfully removed. Please restart Xcode."
      else
        puts "Couldn't find that SDK at path: #{removing}"
      end
    end

    def display_banner
      puts "-" * 29
      puts "Running Fixing Xcode.app SDK Paths."
      puts "-" * 29
    end
  end
end

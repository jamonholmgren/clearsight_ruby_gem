# ClearSight

ClearSight Studio's swiss army knife. Common utilities for ClearSight Studio, a web and mobile app development studio in Portland, OR/Vancouver, WA.

## Installation

Install it:

    $ gem install clearsight

If you need `sudo`, it's probably because you're not using chruby or rvm properly.

## Usage

### Deploy

```
cs deploy
```

This is not implemented yet.

### Update

```
cs update
```

Updates the clearsight gem.

### Help

```
cs help
```

Displays help.

### Kill Rails

```
cs killrails <port>
```

Kills any process running on port <port>, including rails servers.

### SSHify

```
cs sshify user@example.com
```

Sets up remote SSH key on example.com for user.

### Middleman

```
cs mm new <appname>
```

Makes a new Middleman project from the ClearSight template in the <appname> folder.

### Symlink Xcode SDKs

```
cs symlink_xcode_sdks
```

Read [this blog post](http://blog.markrickert.me/crap-an-xcode-update-wiped-out-my-ios-6-sdk-again-2) for an explanation.

### ...and more

More development on its way as we port our old shell scripts to this gem!




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

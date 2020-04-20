# Swift Checker

This gem allows for validating SWIFT / BIC codes. It uses an external api to do so.

# Installation

`gem "swift_checker"`

# Simple usage

```
require "swift_checker"

swift_checker = SwiftChecker.new

result = swift_checker.validate(swift)

if result.success?
  # all good
else
  result.error_messages
end
```

# Production usage

```
require "swift_checker"

# if anything important changes in api you want to know about that
class Watcher
  def notify_human(info)
    Email.notify_admin(info)
  end
end

watcher = Watcher.new

swift_checker = SwiftChecker.new(watcher: watcher)

result = swift_checker.validate(swift) # throws a StandardError if network fails

if result.success?
  # all good
else
  result.error_messages
end
```

# Disclimer

The gem and api is provided as is. I commes without any assurances and obligations. I am not responsible if it causes any hardships. Please use it responsibly.

# Swift Checker

This gem allows for validating SWIFT numbers. It uses an external api to do so.

# Installation

`require "swift_checker"`

# Simple usage

```
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



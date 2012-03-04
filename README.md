# InFormat

Easily add custom getter and setter filters for attributes on ActiveRecord objects.

## Usage

```ruby
class MyModel < ActiveRecord::Base
  in_format :name, setter: lambda {|v| v.upcase }, getter: lambda {|v| "Mrs. #{v}"}
end
```

## License

* Freely distributable and licensed under the [MIT license](http://cfarajpour.mit-license.org/license.html).
* Copyright (c) 2012 Cyrus Farajpour (smoils@gmail.com)
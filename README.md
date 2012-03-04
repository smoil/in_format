# InFormat

Easily add custom getter and setter filters for attributes on ActiveRecord objects.

## Usage

## in_format

The `in_format` method is the most general and accepts a getter and/or a setter.  

Under the hood these override the existing setters/getters and process the value through the supplied Proc/lambda.

You can access the original getter by passing `true` to the new one

```ruby
class MyModel < ActiveRecord::Base
  in_format :name, setter: lambda {|v| v.upcase }, getter: lambda {|v| "Mrs. #{v}"}
end
```

<pre>
  m = MyModel.new(name: "shirley")
  m.name(true) #=> "SHIRLEY"
  m.name #=> "Mrs. SHIRLEY"
</pre>

## License

* Freely distributable and licensed under the [MIT license](http://cfarajpour.mit-license.org/license.html).
* Copyright (c) 2012 Cyrus Farajpour (smoils@gmail.com)
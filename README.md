# InFormat

Easily add custom getter and setter filters for attributes on ActiveRecord objects.  These can be useful if you wish to scrub data before it hits your datastore and/or provide uniformity when reading.

## Usage

Invoke `in_format`, `phone_format` or `ssn_format` in your Model for attributes you wish to process.

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

This example is contrived and a little dangerous, `MyModel.new(name: nil) #=> splode!`, but you can do a lot with getters/setters.

## phone_format

`phone_format` uses `in_format` with some pre-defined getters and setters.

```ruby
class MyModel < ActiveRecord::Base
  phone_format :phone
end
```

<pre>
  m = MyModel.new(phone: "(213) 222-2222")
  m.name(true) #=> "2132222222"
  m.name #=> "222-222-2222"
</pre>

You can supply your own getter or setter like `in_format` if the defaults don't match your needs.

## ssn_format

`ssn_format` works much like `phone_format`

```ruby
class MyModel < ActiveRecord::Base
  ssn_format :ssn
end
```

<pre>
  m = MyModel.new(ssn: "123 45 6789")
  m.name(true) #=> "123456789"
  m.name #=> "123-45-6789"
</pre>

## License

* Freely distributable and licensed under the [MIT license](http://cfarajpour.mit-license.org/license.html).
* Copyright (c) 2012 Cyrus Farajpour (smoils@gmail.com)
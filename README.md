# InFormat

Easily add custom getter and setter filters for attributes on ActiveRecord objects.  These can be useful if you wish to scrub data before it hits your datastore and/or provide uniformity when reading.

## Requirements

For Ruby 1.9.0 and greater. Tested with Rails 3.1+ using ActiveRecord.  It should work with any ORM that provides a hash syntax for accessing attributes in Models (please let me know if you have success/failures with other ORMs).

## Installation

Add the requirement to your Gemfile

`gem "in_format"`

That's it if using ActiveRecord.  If using a different ORM you will need to `extend InFormat` on the models, add an initializer or shoehorn it in some other way.

## Usage

Invoke `in_format`, `phone_format` or `ssn_format` in your Model for attributes you wish to process.

### in_format

The `in_format` method is the most general and accepts a getter and/or a setter.  

Under the hood these create setters/getters and process the value through the supplied Proc/lambda and set/read the value using the hash syntax (`self[:attribute_name]`).

There is an `use_accessor` option which will override getter/setter methods matching the attribute. This can be useful if you want to combine `in_format` with `attr_accessor` or gems like [attr_encrypted](https://github.com/shuber/attr_encrypted) (just be sure that the overridden methods exist before using `in_format`).

You can access the original getter by passing `true` to the new one (assuming you supplied a getter).

```ruby
class MyModel < ActiveRecord::Base
  in_format :name, setter: lambda {|v| v.upcase }, getter: lambda {|v| "Mrs. #{v}"}
  
  attr_accessor :some_attribute
  in_format :some_attribute, setter: -> v { "#{v}s"}, getter: -> v { "3 {v}"}
end
```

<pre>
  m = MyModel.new(name: "shirley")
  m.name(true) #=> "SHIRLEY"
  m.name #=> "Mrs. SHIRLEY"
  
  m.some_attribute = "beer"
  m.some_attribute(true) #=> "beers"
  m.some_attribute #=> "3 beers"
</pre>

This example is contrived and a little dangerous, `MyModel.new(name: nil) #=> splode!`, but you can do a lot with getters/setters.

### phone_format

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

### ssn_format

`ssn_format` works much like `phone_format`, also accepts custom getters/setters.

```ruby
class MyModel < ActiveRecord::Base
  ssn_format :ssn
end
```

or with `attr_encrypted`

```ruby
class MyModel < ActiveRecord::Base
  attr_encrypted :ssn # defined before call to ssn_format
  ssn_format :ssn, use_accessor: true
end
```

<pre>
  m = MyModel.new(ssn: "123 45 6789")
  m.name(true) #=> "123456789"
  m.name #=> "123-45-6789"
</pre>

## Reccomendations

If you have getters/setters you would like to re-use across many attributes or classes I would stick em all in a (well-tested) module and keep an eye out for edge cases.  You can also use `in_format` as the base for your own custom methods like `phone_format`, etc.

```ruby
module MyFormatters
  CAPS = -> v { |v| v ? v.to_s.capitalize : "Generic Dog Name" }
  NO_CATS = lambda do |v|
    if v =~ /cat/
      v.gsub("cat", "")
    else
      v
    end
  end
end

class MyModel < ActiveRecord::Base
  in_format :dog_name, setter: MyFormatters::NO_CATS, getter: MyFormatters::CAPS
end
```

## Upcoming

Currently this is written specifically for ActiveRecord but I hope to make it compatible with more ORMs. In the meantime you can use the alias option and it should work with any ruby class.

## License

* Freely distributable and licensed under the [MIT license](http://cfarajpour.mit-license.org/license.html).
* Copyright (c) 2012 Cyrus Farajpour (smoils@gmail.com)
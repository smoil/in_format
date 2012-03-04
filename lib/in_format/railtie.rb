module InFormat
  class Railtie < Rails::Railtie

    initializer "in_format.initialize" do

      #ActiveSupport.on_load :active_model do
        ActiveRecord::Base.extend(InFormat)
      #end

    end

  end
end
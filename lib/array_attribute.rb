
# Array atrribute accessor helper.
#
# This helper creates two methods to classes.
#
# array_attribute and carray_attribute.
#
# With these you can create methods that encapsulate an array
# property if you have never used or accessed the property it will
# have an empty array as a default value.
#
# <code>
#   class Developer
#     carray_attribute :fingers
#     array_attribute :tickets, :hot_chicks
#   end
#   
#   developer = Developer.new
#   
#   puts developer.tickets.inspect
#   
#   developer.tickets << 1
#   developer.tickets << 2
#   developer.tickets << 3
#   puts developer.tickets.inspect
#   
#   developer.tickets.pop
#   developer.tickets.pop
#   puts developer.tickets.inspect
#   
#   developer.tickets.pop
#   puts developer.tickets.inspect
#   
#   puts developer.hot_chicks.inspect
#   
#   developer.hot_chicks << 1
#   developer.hot_chicks << 2
#   developer.hot_chicks << 3
#   puts developer.hot_chicks.inspect
#   
#   puts Developer.fingers.inspect 
#   
#   (1..10).to_a.each do |finger|
#     Developer.fingers << finger
#   end
#   
#   puts Developer.fingers.inspect 
# <code>
#
class Module

  # Instance level attribute accessor helper generator.
  def array_attribute(*names)
    names.each do |name|
      self.send(:define_method, name) do
        unless instance_variable_get("@#{name}")
          instance_variable_set("@#{name}", [])
        end
        instance_variable_get("@#{name}")
      end
    end
  end

  # Class level attribute accessor helper generator.
  def carray_attribute(*names)
    names.each do |name|
      self.class.send(:define_method, name) do
        unless instance_variable_get("@#{name}")
          instance_variable_set("@#{name}", [])
        end
        instance_variable_get("@#{name}")
      end
    end
  end

end


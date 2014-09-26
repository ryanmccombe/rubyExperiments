##
# You probably know, that in Javascript (and also Ruby) there is no concept of
# interfaces. There is only a concept of inheritance, but you can't assume that
# a certain method or property exists, just because it exists in the parent
# prototype / class. We want to find out, whether a given object fulfils the
# requirements to implement the "SantaClausable" interface. We need to implement
# a method which checks for this interface.
# Rules
# The SantaClausable interface is implemented, if all of the following methods
# are defined on an object:
#   sayHoHoHo() / say_ho_ho_ho
#   distributeGifts() / distribute_gifts
#   goDownTheChimney() / go_down_the_chimney

class SantaClaus
  def say_ho_ho_ho
    # Ho Ho Ho!
  end

  def distribute_gifts
    # Gifts for all!
  end

  def go_down_the_chimney
    # Whoosh!
  end
end

class NotSantaClaus
  def say_ho_ho_ho
  end
end

REQUIRED_METHODS = [ :say_ho_ho_ho, :distribute_gifts, :go_down_the_chimney ]

# solution
def is_santa_clausable(obj)
  REQUIRED_METHODS.all? { |m| obj.respond_to?(m) }
end
    puts is_santa_clausable(SantaClaus.new) # must return TRUE
    puts is_santa_clausable(NotSantaClaus.new) # must return FALSE

# alternative for class input using .method_defined?
# would also work for obj input using .class.method_defined?
def is_santa_clausable2(cls)
  REQUIRED_METHODS.all? { |m| cls.method_defined?(m) }
end
    puts is_santa_clausable2(SantaClaus) # must return TRUE
    puts is_santa_clausable2(NotSantaClaus) # must return FALSE
##
# Complete the function so that it returns the number of seconds that have elapsed between the start and end times given.
# The start/end times are given as Date (JS/CoffeeScript) and Time (Ruby) instances.
# The start time will always be before the end time.

def elapsed_seconds(start_time, end_time)
  end_time - start_time
end

# If you subtract two Ruby Time objects, the result is a rational representing the number of seconds between them.
# http://www.ruby-doc.org/core-2.1.3/Time.html
# Would return days if used on Date objects
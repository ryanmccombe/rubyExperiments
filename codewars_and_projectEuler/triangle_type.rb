# In this kata, you should calculate type of triangle with three given sides a, b and c.
# If all angles are less than 90°, this triangle is acute and function should return 1.
# If one angle is strictly 90°, this triangle is right and function should return 2.
# If one angle more than 90°, this triangle is obtuse and function should return 3.
# If three sides cannot form triangle, or one angle is 180° (which turns triangle into segment) - function should return 0.

def triangle_type (*side)
  side.sort!
  return 0 if side[0] + side[1] <= side[2]
  hypotenuse = (side[0]**2 + side[1]**2)**0.5
  2 + (side[2] <=> hypotenuse)
end
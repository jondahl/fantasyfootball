#! /usr/bin/env ruby

# Approach:
# 1. Best player that can be confidently drafted at each point
# 2. OR: probablistic?
# 3. TODO:

swap_first_two = true

values = Hash.new
values["qb"] = Hash.new
values["te"] = Hash.new
values["wr"] = Hash.new(0)
values["rb"] = Hash.new(0)

values["qb"][1] = [71,"Brady"] # Brady
values["qb"][2] = [71,"Brady"] # Brady
values["qb"][3] = 35 # Brees
values["qb"][4] = 35 # Brees
values["qb"][5] = 0 # wait on mariota
values["qb"][6] = 0 # wait on mariota
values["qb"][7] = 21 # Mariota
values["qb"][8] = 21 # Mariota
values["qb"][9] = 0 # Dalton
values["qb"][10] = 0 # Dalton


if swap_first_two
  values["rb"][1] = 124 # McCoy
  values["rb"][2] = 64 # Crowell
else
  values["rb"][1] = 87 # Ajayi
  values["rb"][2] = 72 # Murray 76, Howard 69
end

values["rb"][3] = 48 # Mixon, Ware
values["rb"][4] = 48 # Ware, Ware
values["rb"][5] = 42 # Woodhead, Powell
values["rb"][6] = 39 # Woodhead, Powell
values["rb"][7] = 0 # nobody - wait on riddick etc.
values["rb"][8] = 25 # duke Johnson
values["rb"][9] = 34 # Riddick, hopefully
values["rb"][10] = 23 # Sproles

if swap_first_two
  values["wr"][1] = 126 # Michael Thomas
  values["wr"][2] = 72 # Hilton, Baldwin
else
  values["wr"][1] = 91 # Michael Thomas
  values["wr"][2] = 91 # Michael Thomas
end

values["wr"][3] = 62 # Demariyus sometimes (62); Crabtree always (59)
values["wr"][4] = 59 # Crabtree, Fitzgerald, Sneed
values["wr"][5] = 58 # Fitzgerald, Snead
values["wr"][6] = 58 # Fitzgerald, Snead
values["wr"][7] = 47 # Garcon
values["wr"][8] = 23 # Meredith
values["wr"][9] = 16 # Kenny Britt
values["wr"][10] = 16 # John Brown

values["te"][1] = 0 # wait on Kelce
values["te"][2] = 0 # wait on Kelce
values["te"][3] = 50 # Kelce 71 OR: 50 Olsen.
values["te"][4] = 50 # Olsen
values["te"][5] = 0 # wait on Rudolph
values["te"][6] = 0 # wait on Rudolph
values["te"][7] = 29 # Rudolph
values["te"][8] = 29 # Rudolph
values["te"][9] = 13 # Ertz
values["te"][10] = 13 # Ertz

positions = ["qb", "te", "wr", "wr", "wr", "wr", "rb", "rb", "rb"]

max_points ||= 0
best_order ||= []
1000.times do
  order = positions.shuffle
  new_points = 0
  order.each_with_index do |p, i|
    last_index_for_p = order.size - order.reverse.index(p)
    if ["wr","rb"].include?(p) && (i == (last_index_for_p-1))
      # puts "last instance of #{p} is #{last_index_for_p}. half points."
      new_points += (values[p][i+1].first * 0.7)
    else
      new_points += values[p][i+1].first
    end
  end
  if new_points > max_points
    max_points = new_points
    best_order = order
    puts max_points
    puts best_order.join(" ")
    puts "---"
  end
end

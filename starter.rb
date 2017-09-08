#! /usr/bin/env ruby

# Approach:
# 1. Best player that can be confidently drafted at each point
# 2. OR: probablistic?
# 3. TODO:

values = Hash.new
values["qb"] = Hash.new
values["te"] = Hash.new
values["wr"] = Hash.new(0)
values["rb"] = Hash.new(0)

values["qb"][1] = [71,"Brady"] # Brady
values["qb"][2] = [71,"Brady"] # Brady
values["qb"][3] = [35, "Brees"] # Brees
values["qb"][4] = [35, "Brees"] # Brees
values["qb"][5] = [0] # wait on mariota
values["qb"][6] = [0] # wait on mariota
values["qb"][7] = [21, "Mariota"] # Mariota
values["qb"][8] = [21, "Mariota"] # Mariota
values["qb"][9] = [0, "Dalton, Prescott"] # Dalton
values["qb"][10] = [0, "Dalton, Prescott"] # Dalton

values["rb"][1] = [115, "McCoy"] # McCoy
values["rb"][2] = [65, "Fournette, Crowell"] # Crowell
values["rb"][3] = [60, "Montgomery"] # Mixon, Ware
values["rb"][4] = [48, "Mixon, Ware"] # Ware, Ware
values["rb"][5] = [38, "Martin, Abdullah, Ingram"]
values["rb"][6] = [38, "Martin, Abdullah, Ingram"]
values["rb"][7] = [30, "Gore, Riddick"]
values["rb"][8] = [25, "Duke Johnson"]
values["rb"][9] = [23, "Sproles"]
values["rb"][10] = [23, "Sproles"] #

values["wr"][1] = [126, "Julio Jones"] # Julio
values["wr"][2] = [71, "Hilton"] # Hilton
values["wr"][3] = [59, "Crabtree"]
values["wr"][4] = [59, "Fitzgerald"]
values["wr"][5] = [58, "Snead"]
values["wr"][6] = [51, "Sanders"]
values["wr"][7] = [23, "Meredith"] # Garcon
values["wr"][8] = [23, "Meredith"] # Meredith
values["wr"][9] = [16, "Britt"]
values["wr"][10] = [16, "John Brown, Coleman, Britt"]

values["te"][1] = [0] # wait on Kelce
values["te"][2] = [0] # wait on Kelce
values["te"][3] = [71, "Kelce"] # Kelce 71 OR: 50 Olsen.
values["te"][4] = [50, "Olsen"] # Olsen
values["te"][5] = [0] # wait on Rudolph
values["te"][6] = [0] # wait on Rudolph
values["te"][7] = [29, "Rudolph"] # Rudolph
values["te"][8] = [13, "Rudolph"] # Rudolph
values["te"][9] = [13, "Ertz"] # Ertz
values["te"][10] = [13, "Ertz"] # Ertz

positions = ["qb","te", "wr", "wr", "wr", "wr", "rb", "rb", "rb"]

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
    best_order.each_with_index do |position, i|
      puts "#{i+1}: #{values[position][i+1].last} (#{position.upcase})"
    end

    puts "---"

  end
end

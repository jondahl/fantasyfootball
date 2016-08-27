#! /usr/bin/env ruby

values = Hash.new
values["qb"] = Hash.new
values["te"] = Hash.new
values["wr"] = Hash.new(0)
values["rb"] = Hash.new(0)

values["qb"][1] = 63
values["qb"][2] = 63
values["qb"][3] = 63
values["qb"][4] = 63
values["qb"][5] = 43
values["qb"][6] = 43
values["qb"][7] = 43
values["qb"][8] = 7
values["qb"][9] = 7
values["qb"][10] = 7

values["rb"][1] = 62
values["rb"][2] = 62
values["rb"][3] = 20
values["rb"][4] = 18
values["rb"][5] = 18
values["rb"][6] = 1
values["rb"][7] = 0
values["rb"][8] = -10
values["rb"][9] = -15
values["rb"][10] = -15

values["wr"][1] = 85
values["wr"][2] = 82
values["wr"][3] = 51
values["wr"][4] = 46
values["wr"][5] = 38
values["wr"][6] = 22
values["wr"][7] = 22
values["wr"][8] = 22
values["wr"][9] = -5
values["wr"][10] = -5

values["te"][1] = 87
values["te"][2] = 50
values["te"][3] = 36
values["te"][4] = 36
values["te"][5] = 29
values["te"][6] = 29
values["te"][7] = 7
values["te"][8] = 7
values["te"][9] = 7
values["te"][10] = 7

positions = ["qb", "te", "wr", "wr", "wr", "wr","rb","rb", "rb", "rb"]

max_points ||= 0
best_order ||= []
10000.times do
  order = positions.shuffle
  new_points = 0
  order.each_with_index do |p, i|
    last_index_for_p = order.size - order.reverse.index(p)
    if ["wr","rb"].include?(p) && (i == (last_index_for_p-1))
      # puts "last instance of #{p} is #{last_index_for_p}. half points."
      new_points += (values[p][i+1] / 2.0)
    else
      new_points += values[p][i+1]
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

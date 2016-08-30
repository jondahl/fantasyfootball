#! /usr/bin/env ruby

values = Hash.new
values["qb"] = Hash.new
values["te"] = Hash.new
values["wr"] = Hash.new(0)
values["rb"] = Hash.new(0)


# TODO: simulate this draft http://www.fleaflicker.com/nfl/leagues/158052/drafts

values["qb"][1] = 63 # Newton, Wilson
values["qb"][2] = 63
values["qb"][3] = 63
values["qb"][4] = 63 # Wilson, sometimes Newton
values["qb"][5] = 43 # Brady
values["qb"][6] = 43 #
values["qb"][7] = 43 # Brady gone sometimes!
values["qb"][8] = 10 # Brady here 6/7. Otherwise, down to next tier.
values["qb"][9] = 7 # OCCASIONALLY Brady
values["qb"][10] = 7

values["rb"][1] = 62 # Lamar Miller here 4/6.
values["rb"][2] = 53 # Peterson
values["rb"][3] = 20
values["rb"][4] = 18
values["rb"][5] = 18 # Woodhead occasionally (rarely). Langford, Gore, Foster, Rawls
values["rb"][6] = 1
values["rb"][7] = -10 # Sims 0. Otherwise, -10
values["rb"][8] = -10
values["rb"][9] = -15
values["rb"][10] = -15

values["wr"][1] = 85 # Robinson. BAD DRAFT: http://www.fleaflicker.com/nfl/leagues/158052/drafts - would miss out on most targets.
values["wr"][2] = 82 # Robinson or Marshall, or drop to Gronk/Miller? NOT DEZ (Romo injury.
values["wr"][3] = 51 # Cobb 6/10. Watkins, Landry, Edelman. usually. Worst draft: http://www.fleaflicker.com/nfl/leagues/124678/drafts.
values["wr"][4] = 46 # Decker or better
values["wr"][5] = 38 # Moncrief once. Fitzgerald 5/10
values["wr"][6] = 20 # Matthews, Sanders sometimes. Crabtree, Hurns, Brown. Gordon always.
values["wr"][7] = 15 # Josh Gordon sometimes. Not much otherwise.
values["wr"][8] = -1 # Gordon rarely. Sterling Shepherd
values["wr"][9] = -5 #
values["wr"][10] = -5

values["te"][1] = 87 # Gronk
values["te"][2] = 50 # Reed
values["te"][3] = 36 # Olsen
values["te"][4] = 36 # Olsen
values["te"][5] = 29 # Walker 6/7
values["te"][6] = 29 # Walker 6/7
values["te"][7] = 7 # Misc
values["te"][8] = 7 # Misc
values["te"][9] = 7 # Misc
values["te"][10] = 7 # Misc

positions = ["qb", "te", "wr", "wr", "wr", "rb", "rb"]

max_points ||= 0
best_order ||= []
100000.times do
  order = positions.shuffle
  new_points = 0
  order.each_with_index do |p, i|
    last_index_for_p = order.size - order.reverse.index(p)
    if ["wr","rb"].include?(p) && (i == (last_index_for_p-1))
      # puts "last instance of #{p} is #{last_index_for_p}. half points."
      new_points += (values[p][i+1] * 1)
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

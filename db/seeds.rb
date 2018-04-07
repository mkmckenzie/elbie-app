full_names = ['Katrina Bishop','Cassandra Baldwin','Amos Barrett','Ollie Becker','Jonathan Hunter','Colleen Robbins','Lindsey Reeves','Dewey Paul','Aaron Sparks','Gertrude Stevens','Roosevelt Bradley','Cary Cobb','June Crawford','Jacquelyn Kim','Gregory Medina','Beulah Ramos','Gail Shaw','Rogelio Peters','Shannon Thomas','Ronald Reynolds','Rachel Hammond','Jody Hanson','Clint Logan','Bill Rivera','Marco Fisher','Harvey Reese','Lora Klein','Lula Mills','Dominick Drake','Barry Cortez','Jon Sharp','Douglas Marsh','Billie Carpenter','Jamie Coleman','Christina Harmon','Gilbert Newton','Alejandro Wong','Angel Mccoy','Ernestine Byrd','Ron Rose','Clarence James','Felipe Knight','Crystal Perkins','Flora Castillo','Dustin Garner','Jan Simpson','Paul Pierce','Phil Curtis','Rhonda Waters','Christian Clark','Bradley Franklin','Lynda Barnett','Shelly Bowers','Todd Gray','Stella Mclaughlin','Wanda French','Bridget Sutton','Melody Jenkins','Marguerite Buchanan','Mamie Fowler','Wilbur Herrera','Marshall Ellis','Richard Adams','Elmer Jacobs','Iris Anderson','Catherine Patrick','Mabel Bowen','Darren Garrett','Tabitha Dennis','Sheri Gross','Carol Rogers','Beverly Santos','Brooke Cain','Madeline Burke','Patty Williams','Leo Mcgee','Calvin Webb','Ian Bush','Patsy Lloyd','Amber Lawrence','Dominic Walton','Misty Gibson','Brittany Cole','Scott Willis','Duane Page','Shawn Wade','Kendra Osborne','Beatrice Massey','Rebecca Murray','Nicholas Newman','Carrie Rios','Monica Weaver','Kelley Lee','Raquel Welch','Cheryl Barber','Eddie Gutierrez','Terrance Holmes','Olga Cross','Sandy Lopez','Glen Freeman']

User.destroy_all
Team.destroy_all
Teammate.destroy_all

20.times do |x|
  user = User.create(email: "mkmckenzie91+elbie-test-#{x+1}@gmail.com", password: "password", password_confirmation: "password")
  user.save!(validate: false)
  team1 = Team.create(name: "Hair Squad #{x}", user_id: user.id)
  team2 = Team.create(name: "Glam Squad #{x}", user_id: user.id)

  6.times do |x|
    teammate = Teammate.create(name: full_names.shuffle.first, primary_phone: rand.to_s[2..10])
    teammate.teams << team1
  end

  6.times do |x|
    teammate = Teammate.create(name: full_names.shuffle.first, primary_phone: rand.to_s[2..10])
    teammate.teams << team2
  end
end
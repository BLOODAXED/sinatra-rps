require "sinatra"
require "sinatra/reloader"

RPS = ["Rock", "Paper", "Scissors"]

get("/") do
  erb(:rules, { :layout => :layout })
end

get("/rock") do
  
  @p_play = "Rock"
  @cpu_play = RPS[rand(3)]
  @outcome = score("r", @cpu_play[0].downcase)

  erb(:play, { :layout => :layout })
end

get("/paper") do

  @p_play = "Paper"
  @cpu_play = RPS[rand(3)]
  @outcome = score("p", @cpu_play[0].downcase)

  erb(:play, { :layout => :layout })
end

get("/scissors") do

  @p_play = "Scissors"
  @cpu_play = RPS[rand(3)]
  @outcome = score("s", @cpu_play[0].downcase)

  erb(:play, { :layout => :layout })
end

def score(p_throw,c_throw)
    #0 == player win
    #1 == player loss
    #2 == draw
    if p_throw == c_throw
        return 2
    elsif p_throw == "r"
        if c_throw == "s"
            return 0
        else
            return 1
        end
    elsif p_throw == "p"
        if c_throw == "r"
            return 0
        else
            return 1
        end
    elsif p_throw == "s"
        if c_throw == "p"
            return 0
        else
            return 1
        end
    else #in case we get here without p_throw being valid
        puts "bad input"
    end
end

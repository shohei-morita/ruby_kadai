class Player
  def hand
    choose_hand = ["0:グー", "1:チョキ", "2:パー"]
    puts "数字を入力してください。"
    choose_hand.each do |choice|
      puts choice
    end
    while input_hand = gets.chomp
      if ["0", "1", "2"].include?(input_hand)
        return input_hand.to_i
      else
        puts "数字を入力してください。"
        choose_hand.each do |choice|
          puts choice
        end
      end
    end
  end
end


class Enemy
  def hand
    rand(0..2)
  end
end


class Janken
  def pon(player_hand, enemy_hand)

    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"

    while true
      if player_hand - enemy_hand == 0
        puts "あいこです。もう一回頑張りましょう"
        return true
      elsif ((player_hand - enemy_hand) +3) % 3 == 2
        puts "あなたの勝ちです"
        return false
      else
        puts "あなたの負けです"
        return false
      end
    end
  end
end



player = Player.new

enemy = Enemy.new

janken = Janken.new

next_game = true

while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end

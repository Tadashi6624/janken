
require "csv"

def rock_paper_scissors()
  puts "じゃんけん..."
  puts "0（グー）1（チョキ）2（パー）3（戦わない）"

  number = gets.to_i
  case number
  when 0
    puts "あなた：グー"
  when 1
    puts "あなた：チョキ"
  when 2
    puts "あなた：パー"
  when 3
    puts "あなた：ジャンケンをやめました"
    return "quit"
  else
    puts "0〜3の数字を選択してください"
    return "invalid"
  end

  if number == 3
    puts "ジャンケンを終了します"
    return "quit"
  elsif (number >= 0) && (number <= 2)
    opponent_number = rand(0..2)
    case opponent_number
    when 0
      puts "あいて：グー"
    when 1
      puts "あいて：チョキ"
    when 2
      puts "あいて：パー"
    end

    if (opponent_number == 0 && number == 2) || (opponent_number == 1 && number == 0) || (opponent_number == 2 && number == 1)
      puts "あなたの勝ちです"
      result = atchi_muite_hoi("win")
      return result if result == "quit"
    elsif (opponent_number == 0 && number == 1) || (opponent_number == 1 && number == 2) || (opponent_number == 2 && number == 0)
      puts "あなたの負けです"
      result = atchi_muite_hoi("lose")
      return result if result == "quit"
    else
      puts "あいこです"
      return "retry"
    end
  else
    puts "やり直しです"
    return "retry"
  end
end

def atchi_muite_hoi(janken_result)
  puts "あっち向いて..."
  puts "0（上）1（右）2（下）3（左）"

  your_direction = gets.to_i

  unless (0..3).include?(your_direction)
    puts "0〜3の数字を選択してください"
    return "invalid"
  end

  opponent_direction = rand(4)

  directions = ["上", "右", "下", "左"]

  puts "あなた：#{directions[your_direction]}"
  puts "あいて：#{directions[opponent_direction]}"

  if your_direction == opponent_direction
    puts "あなたの勝ちです！" if janken_result == "win"
    puts "あなたは負けました" if janken_result == "lose"
    return "quit"
  else
    puts "もう一度じゃんけんをします"
    return "retry"
  end
end

loop do 
  result = rock_paper_scissors()
  puts "____________________________"

  if result == "quit" || result == "invalid"
    break
  end
end

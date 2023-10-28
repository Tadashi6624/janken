def rock_paper_scissors()
    puts "じゃんけん..."
    puts "0（グー）1（チョキ）2（パー）3（戦わない）"
  
    $number = gets.to_s.chomp
    if $number == "0"
      puts "あなた：グー"
    elsif $number == "1"
      puts "あなた：チョキ"
    elsif $number == "2"
      puts "あなた：パー"
    elsif $number == "3"
      puts "あなた：ジャンケンをやめました"
      return "quit"
    else 
      puts "0〜3の数字を選択してください"
    end
  
    if $number == "0" || $number == "1" || $number == "2"
      opponent_number = rand(0..2).to_s
      if opponent_number == "0"
        puts "あいて：グー"
      elsif opponent_number == "1"
        puts "あいて：チョキ"
      else 
        puts "あいて：パー"
      end
  
      if (opponent_number == "0" && $number == "2") || (opponent_number == "1" && $number == "0") || (opponent_number == "2" && $number == "1")
        puts "あなたの勝ちです"
        atchi_muite_hoi() 
      elsif (opponent_number == "0" && $number == "1") || (opponent_number == "1" && $number == "2") || (opponent_number == "2" && $number == "0")
        puts "あなたの負けです"
        atchi_muite_hoi() 
      else
        puts "あいこです"
      end
    else
      puts "やり直しです"
    end
  end
  
  def atchi_muite_hoi()
    puts "あっち向いて..."
    puts "0（上）1（右）2（下）3（左）"
  
    your_direction = gets.to_i
    opponent_direction = rand(4)
  
    directions = ["上", "右", "下", "左"]
  
    puts "あなた：#{directions[your_direction]}"
    puts "あいて：#{directions[opponent_direction]}"
  
    if your_direction == opponent_direction
      puts "あなたの負けです"
    else
      puts "もう一度！"
      rock_paper_scissors()
      
    end
  end
  
  loop do 
    result = rock_paper_scissors()
    puts "____________________________"
  
    if (result == "quit") || ($number == "3")
      break
    end
  end
  
  
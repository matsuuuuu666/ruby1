puts "1（新規でメモを作成）2（既存のメモを編集する）3(既存のメモを削除する)"

memo_type = gets.to_s
input_number = memo_type.chomp

until input_number === "1" or input_number === "2" or input_number === "3" do
  puts "1か2か3の数字を入力してください。"
  puts "1（新規でメモを作成）2（既存のメモを編集する）3(既存のメモを削除する)"
 
  memo_type = gets.to_s
  input_number = memo_type.chomp
end

case input_number #input_numberをcase文にて条件分岐
when "1" then
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  
  file_name = gets.chomp
  
  puts "メモの内容を入力してください。"
  puts "完了したらCTRL + Dを押下してください。" #入力の完了
  
  input_memo = STDIN.read
  memo = input_memo.chomp
  
  File.open("#{file_name}.txt","w") do |txt| #ファイルの新規作成　書き込みモード
    txt << memo
  end
  
when "2" then
  puts "既存のメモを編集します。拡張子を除いたファイル名を入力してください。"
  
  file_name = gets.chomp
  
  puts "メモの内容を入力してください。"
  puts "完了したらCTRL + Dを押下してください。"
  
  input_memo = STDIN.read
  memo = input_memo.chomp
  
  File.open("#{file_name}.txt","a") do |txt| #ファイルの編集　追加モード
    txt << memo
  end

when "3" then
  puts "既存のメモを削除します。拡張子を除いたファイル名を入力してください。"

  file_name = gets.chomp

  puts "メモを削除します。"

  File.delete("#{file_name}.txt") #ファイルの削除
end
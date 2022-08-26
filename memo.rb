require "csv"

puts "1（新規でメモを作成）2（既存のメモを編集する）"

memo_type = gets.to_s
input_number = memo_type.chomp

until input_number === "1" or input_number === "2" do
 puts "1か2の数字を入力してください。"
 puts "1（新規でメモを作成）2（既存のメモを編集する）"
 
 memo_type = gets.to_s
 input_number = memo_type.chomp
end

if input_number === "1"
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  
  file_name = gets.chomp
  
  puts "メモの内容を入力してください。"
  puts "完了したらCTRL + Dを押下してください。"
  
  input_memo = STDIN.read
  memo = input_memo.chomp
  
  CSV.open("#{file_name}.csv","w") do |csv|
    csv << ["#{memo}"]
  end
  
elsif input_number === "2"
  puts "既存のメモを編集します。拡張子を除いたファイル名を入力してください。"
  
  file_name = gets.chomp
  
  puts "メモの内容を入力してください。"
  puts "完了したらCTRL + Dを押下してください。"
  
  input_memo = STDIN.read
  memo = input_memo.chomp
  
  CSV.open("#{file_name}.csv","a") do |csv|
    csv << ["#{memo}"]
  end
  
end
require './configs/app_config.rb'

results = Models::Result.fetch_all

puts "Список результатов:\n\n"

results.each do |result|
  puts "================================================================"
  puts "Имя: #{result['user_name']}"
  puts "Количество решеных примеров: #{result['tasks_count']}"
  puts "Количество правильных ответов: #{result['correct_answers_count']}"
  puts "Общая продолжительность теста в секундах: #{result['duration']}"
  puts "В среднем на ответ в секундах: #{result['duration_average']}"
end

puts "================================================================"
require './configs/app_config.rb'

puts "Здравствуйте, мы собираем статистику по решению примеров."
puts "Как Вас зовут?"
user_name = gets.chomp

puts "Сколько вам полных лет?"
user_age = gets.to_i

current_user = Models::User.new(user_name, user_age)

puts "Сколько примеров хотите решить? От 10 до 100"
tasks_count = gets.to_i

until tasks_count >= 1 && tasks_count <= 100  do
  tasks_count < 10 ? puts("Слишком мало") : puts("Слишком много")

  puts "Сколько примеров хотите решить? От 10 до 100"
  tasks_count = gets.to_i
end

tasks_count.times { current_user.tasks << Models::Task.new }

puts "Отлично!\nПо окончанию Вам будет показана ваша статистика.\nУдачи!"

start_time = Time.now
current_user.start_test
end_time = Time.now

result = Models::Result.new(current_user.name,
                            current_user.tasks.size,
                            current_user.tasks.select(&:correct?).size,
                            end_time - start_time)

puts "\n==========================================================="
puts "Тест завершен. Результаты: \n"
puts "Количество примеров: #{result.tasks_count}"
puts "Решено верно: #{result.correct_answers_count}"
puts "Общее затраченое время: #{result.duration} секунд"
puts "Среднее время на пример: #{result.duration_average} секунд"
puts '==========================================================='

result.save
puts "\n#{current_user.name}, Ваши результаты сохранены. Спасибо"



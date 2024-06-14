(1..20).each do |i|
  Game.create({
                name: "Game #{i}"
              })
end

message = 'Games added'
puts message if Rails.env.development?
Rails.logger.debug message

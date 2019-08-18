require_relative "room"

class Hotel
  def initialize(hotel_name, room_names)
    @name = hotel_name
    @rooms = {}
    room_names.each { |room_name, capacity| @rooms[room_name] = Room.new(capacity) }
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.key?(room_name)
  end

  def check_in(guest, room_name)
    if room_exists?(room_name)
        if @rooms[room_name].add_occupant(guest)
            puts 'check in successful' 
        else
            puts 'sorry, room is full'
        end
    else
        puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each { |room_name, room| puts "#{room_name}: #{room.available_space}" } # string interpolation (and escape sequences like \n) only work with "", not ''
  end

end
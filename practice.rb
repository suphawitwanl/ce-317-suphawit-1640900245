# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password

    def initialize(name, email, password)
        @name = name
        @password = password
        @rooms = []
    end

    def enter_room(room)
        @rooms << room
        room.users << self
    end

    def send_message(room, content)
        message = Message.new(self, room, content)
        room.broadcast(message)
    end

    def acknowledge_message(room, message)
        puts "Message from #{message.user.name} in #{room.name}: #{message.content}"
    end
end

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users

    def initialize(name, description)
        @name = name
        @description = description
        @users = []
    end

    def broadcast(message)
        @users.each do |user|
            user.acknowledge_message(self, message)
        end
    end
end

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content

    def initialize(user, room, content)
        @user = user
        @room = room
        @content = content
    end
end

# add a method to user so, user can enter to a room
# user.enter_room(room)
user1 = User.new("George", "gg_rubsarb@gmail.com", "sdfslkj123")
room1 = Room.new("Cooking", "A room for cooking enthusiasts")
user1.enter_room(room1)
user1.send_message(room1, "I love cooking!")

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
message = Message.new(user1, room1, "I love cooking!")
user1.acknowledge_message(room1, message)

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
room1.broadcast(message)
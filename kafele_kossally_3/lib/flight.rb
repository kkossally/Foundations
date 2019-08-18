class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        self.passengers.length == @capacity
    end

    def board_passenger(passenger)
        if !self.full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        passenger_list = []
        self.passengers.each { |passenger| passenger_list << passenger.name }
        passenger_list
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end
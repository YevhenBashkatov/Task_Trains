require_relative 'AbstractCarrige'
class PassengerCarrige < AbstractCarrige
  attr_accessor :seats_occupied
  def initialize(seats_amount, company_name)
    super(company_name)
    @seats_amount = seats_amount
    @seats_occupied = 0
  end

  def carrige_type
    :passenger
  end

  def seats_take
    @seats_occupied += 1 if @seats_occupied + 1 <= @seats_amount
  end

  def seats_free
    @seats_amount - @seats_occupied
  end

  def seats_nonfree
    @seats_occupied
  end

end

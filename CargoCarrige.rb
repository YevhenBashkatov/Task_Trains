require_relative 'AbstractCarrige'
class CargoCarrige < AbstractCarrige
  attr_accessor :volume, :volume_amount
  def initialize(volume,company_name)
    @volume = volume
    @volume_amount = 0
    super(company_name)
  end
  def carrige_type
    :cargo
  end

  def volume_take(num)
    @volume_amount += num if @volume_amount + num <= @volume
  end

  def volume_unamount
    @volume - @volume_amount
  end

  def volume_nonfree
    @volume_amount
  end

end

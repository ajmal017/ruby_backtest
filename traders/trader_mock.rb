class TraderMock < Trader
  def setup
    @param1 = 1
    @param2 = 2
    @param3 = 3
    @param4 = 4
  end
  
  def run
    case time(0).min % 60
    when 0
      unless order_exists?(1234)
        open_order(base_symbol, OrderLong, 10, 0, 0, 1234)
      end
    when 1
      if order_exists?(1234)
        order = get_order(1234)
        close_order(order)
      end
    when 2
      unless order_exists?(1234)
        open_order(base_symbol, OrderShort, 5, 0, 0, 1234)
      end
    when 3
      if order_exists?(1234)
        order = get_order(1234)
        close_order(order)
      end
    end
  end
  
  def finalize
    
  end
end
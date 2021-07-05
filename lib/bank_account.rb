class BankAccount
attr_accessor :balance, :transfer
 
  def initialize(balance)
    @balance = balance
end

  def initialize(transfer)
    @transfer = transfer
  end
  
  def add_transfer(transfer)
    @transfer << transfer
  end
end
  
  
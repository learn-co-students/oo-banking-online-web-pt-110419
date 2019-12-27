class BankAccount
  
  attr_reader :name
  attr_accessor :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
end

def deposit(amount)
  @balance = @balance + amount
end

def display_balance
  p "Your balance is $#{@balance}."
end

def valid?
is_valid = false
@balance > 0 && @status == "open" ? is_valid = true : is_valid = false
is_valid
end

def close_account
  @status = "closed"
end

end

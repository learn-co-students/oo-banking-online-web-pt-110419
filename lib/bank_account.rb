require 'pry'
class BankAccount

attr_accessor :balance, :status
attr_reader :name, :display_balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money_to_deposit)
    @balance = @balance + money_to_deposit
    # @balance has to be updated since what if I need to continue working on balanc in later methods
    # a local variable storing the new amount would return the new amount but its scope is limited to this method so that new amount cannot be accessed in later methods
    # binding.pry
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end

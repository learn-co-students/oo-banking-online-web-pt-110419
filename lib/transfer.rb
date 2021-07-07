require 'pry'
class Transfer

attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @status == "pending" && @sender.balance > @amount
      # valid? verifies that the sender and receiver accounts are valid and @status == "pending" allows a successful transaction to occur only once since if its marked as "complete" the execute_transaction method won't execute due to the condition set
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
      # binding.pry
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      end
    # binding.pry
  end

  def reverse_transfer
    # this should only execute if a transfer execution has occured therefore the method should only execute if @status is complete
    if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end
end

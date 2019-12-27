class Transfer
  attr_accessor :status, :sender, :receiver, :amount, :one_time_transfer 

def initialize(sender, receiver, amount)
  @status = "pending"
  @sender = sender
  @receiver = receiver
  @amount = amount
  @one_time_transfer = 1
end

def valid?
  is_valid_transfer = false
  sender.valid? == true && receiver.valid? == true ? is_valid_transfer = true : is_valid_transfer = false
end

def execute_transaction
  
  if valid? == true && @one_time_transfer == 1
    sender.balance = sender.balance - @amount
    receiver.balance = receiver.balance + @amount
    @status = "complete"
    @one_time_transfer +=1
  else @status = "rejected"
   end
  if @sender.balance <= 0
  @status = "rejected"
end
p "Transaction rejected. Please check your account balance."
end
def reverse_transfer
 if @status == "complete" 
   sender.balance = sender.balance + @amount
   receiver.balance = receiver.balance - @amount
 end
 @status = "reversed"
end
end

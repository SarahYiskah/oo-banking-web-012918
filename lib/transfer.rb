class Transfer
  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && sender.balance > self.amount && @status == 'pending'
      sender.balance -= self.amount
      receiver.balance += self.amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && receiver.balance > self.amount && @status == 'complete'
      sender.balance += self.amount
      receiver.balance -= self.amount
      @status = 'reversed'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

end

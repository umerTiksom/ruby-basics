# module for the class
module Receipt
  def print
    puts '------- Receipt ----------'
    puts
    puts "Transaction ID = #{@transaction_id}"
    puts "Amount = #{@amount}"
    puts
  end

  def refund
    puts "Refund of #{@amount} has been processed."
  end
end

class Payment
  def initialize(amount, transaction_id)
    @amount = amount
    @transaction_id = transaction_id
  end

  def display
    puts "Transaction ID = #{@transaction_id}"
    puts "Amount = #{@amount}"
  end

  def process_payment
    puts 'Processing payment...'
  end
end

class Cash < Payment
  include Receipt

  def initialize(amount, transaction_id, received_amount)
    super(amount, transaction_id)
    @received_amount = received_amount
  end

  def process_payment
    puts 'Cash payment successful.'
    puts "Change Returned = #{@received_amount - @amount}"
  end
end

class CreditCard < Payment
  include Receipt

  attr_accessor :card_number, :card_holder

  def initialize(amount, transaction_id, card_number, card_holder)
    super(amount, transaction_id)
    @card_number = card_number
    @card_holder = card_holder
  end

  def process_payment
    puts 'Credit Card payment successful.'
    puts "Card Holder = #{@card_holder}"
  end
end

class BankTransfer < Payment
  include Receipt

  def initialize(amount, transaction_id, account_number, bank_name)
    super(amount, transaction_id)
    @account_number = account_number
    @bank_name = bank_name
  end

  def process_payment
    puts 'Bank Transfer completed.'
    puts "Bank = #{@bank_name}"
  end
end

class PayPal < Payment
  include Receipt

  def initialize(amount, transaction_id, email)
    super(amount, transaction_id)
    @email = email
  end

  def process_payment
    puts 'PayPal payment successful.'
    puts "Email: #{@email}"
  end
end

payments = []

payments << Cash.new(30_000, 'BB101', 15_000)

payments << CreditCard.new(250_000, 'BB1012', '1234-5678-9012-3456', 'Babar Ali')

payments << BankTransfer.new(50_000, 'BT10010', '987654321', 'HBL')

payments << PayPal.new(75_000, 'PL1213', 'ali@example.com')

payments.each do |py|
  puts
  py.display
  puts
  py.process_payment
  puts
  py.print
  puts
  py.refund
end

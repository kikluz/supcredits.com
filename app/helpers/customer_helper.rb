module CustomerHelper
  def count_credits(customer_id)
    Credit.where(customer_id: customer_id).sum(:amount)
  end
end

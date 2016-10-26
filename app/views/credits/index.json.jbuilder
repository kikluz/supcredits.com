json.array!(@credits) do |credit|
  json.extract! credit, :id, :amount, :customer_id
  json.url credit_url(credit, format: :json)
end

json.array! @customers do |customer|
  json.partial! '/customer', customer: customer
end

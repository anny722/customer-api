json.array! @customers do |customer|
  json.partial! 'v1/customers/customer', customer: customer
end

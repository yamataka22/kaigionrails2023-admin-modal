json.extract! product, :id, :name, :category, :stock, :price, :description, :status, :sale_start_date, :sale_end_date, :memo, :created_at, :updated_at
json.url product_url(product, format: :json)

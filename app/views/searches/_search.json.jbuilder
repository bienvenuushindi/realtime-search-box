json.extract! search, :id, :query, :count, :result_count, :created_at, :updated_at
json.url search_url(search, format: :json)

json.extract! post, :id, :question, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
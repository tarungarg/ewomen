json.extract! task, :id, :project_id, :name, :description, :created_at, :updated_at
json.url task_url(task, format: :json)

namespace :migrate_data do
  desc "This task migrates contentful_id from contentful to local db"
  task :create_contentful_id_reference do
    Recipe.model_entries.map do |e|
      Recipe.find_or_create_by(contentful_id: e.id)
    end
  end
end
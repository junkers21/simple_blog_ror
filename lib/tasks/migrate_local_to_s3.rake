namespace :migrate_local_to_s3 do
  desc "Migrate data from local to S3 server"
  task start: :environment do
    ActiveStorage::Attachment.find_each do |at|
      next unless at.blob.service_name == "local"
      begin
        blob = at.blob
        blob.open do |f|
          at.record.send(at.name).attach(io: f, content_type: blob.content_type, filename: blob.filename)
        end
        blob.destroy
      rescue ActiveStorage::FileNotFoundError
        puts "Error migrating file"
      end
    end
  end
end
class AddAttachmentAudioToEpisodes < ActiveRecord::Migration
  def self.up
    change_table :episodes do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :episodes, :audio
  end
end

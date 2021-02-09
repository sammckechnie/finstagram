class FinstagramPost < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :likes

  validates_presence_of :user

  def humanized_time_ago
    # (time_ago_in_seconds = self.created_at - 60).to_s)
   time_ago_in_seconds = Time.now - self.created_at
    time_ago_in_minutes = time_ago_in_seconds / 60

#Days ago
    if time_ago_in_minutes >= 1440
      "#{(time_ago_in_minutes / 1440).to_i} Days ago"

#Two or more hour(s)
      elsif time_ago_in_minutes >= 120
      "#{(time_ago_in_minutes / 60).to_i} Hours ago"

#one "hour" ago
      elsif time_ago_in_minutes >= 60
      "#{(time_ago_in_minutes / 60).to_i} Hour ago"

    elsif time_ago_in_minutes <= 60 && time_ago_in_minutes >=1
      "#{(time_ago_in_minutes.to_i)} Minutes ago"

    else
      "#{(time_ago_in_minutes * 60).to_i} Seconds ago"
    end
  end
  # New Stuff Start 
  def like_count
    self.likes.size
  end

  def comment_count
    self.comments.size
  end
  # New Stuff End
end
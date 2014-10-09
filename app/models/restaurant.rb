class Restaurant < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  has_many :reviews
  has_many :restaurant_categories
  has_many :categories, :through => :restaurant_categories

  def position
    geocode.presence || CGI.escape(address)
  end

  def distance_from_school
    JSON.parse(json_from_school)["rows"].first["elements"].first["distance"]["value"]
  end

  def time_required_from_school
    JSON.parse(json_from_school)["rows"].first["elements"].first["duration"]["value"] / 60
  end

  def score_star
    score = tabelog_score.presence || 0 
    full_star = score.to_i
    harf_star = (score - full_star) >= 0.5 ? 1 : 0
    empty_star = 5 - (full_star + harf_star)
    
    star = '<i class="fa fa-star"></i>' * full_star
    star += '<i class="fa fa-star-half-o"></i>' * harf_star
    star += '<i class="fa fa-star-o"></i>' * empty_star
    
    star
  end

  private

  def json_from_school
    uri = URI.parse("https://maps.googleapis.com/maps/api/distancematrix/json?origins=34.707536,135.496415&destinations=#{position}")
    json = Net::HTTP.get(uri)
  end

end

module ProfileConcern
  extend ActiveSupport::Concern

  def sanitize_phone(number)
    # Strip the number
    @new_number = number.strip

    # Remove hyphens
    @new_number.gsub! /[-]/,""

    # Delete all non-numeric characters
    @new_number.gsub! /\s*[^0-9\.\&\@]\s*/, ''  

    # Truncate to only have 10 characters
    if @new_number.length > 10
      @new_number = @new_number.first(10)
    elsif @new_number.length < 10
      @new_number = 'Invalid Number'
    end
    @new_number
  end

  def user_name_created
    if @current_member
      user_name_created = @current_member.profile.user_name_created
    else
      user_name_created = false
    end
  end

  def sanitize_user_name(user_name)
    # Strip the user_name
    @new_user_name = user_name.strip

    # Delete all non-alphanumeric, underscore or periods
    @new_user_name.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, ''  

    # Check for user_name length 20
    if @new_user_name.length > 20
      @new_user_name = 'Too Long'
    end
    @new_user_name
  end

  def user_name_blacklist(user_name)
    @result_of_check = false

    blacklist = [
                  # Protected Names
                  'guest',
                  'user', 
                  'member', 
                  'moderat', 
                  'admin', 
                  'church',

                  # Bad Words
                  'shit',
                  'crap',
                  'fuck',
                  # 'hell', # Removed because it can be a part of a word
                  # 'ass', # Removed because it can be a part of a word

                  # Holy Words
                  'god'
                  # 'jesus', # Removed because it can be a part of a word/name
                  # 'christ', # Removed because it can be a part of a word/name
    ]

    blacklist.each do |term|
      if user_name.downcase.include? term
          @result_of_check = true
      end
    end

    @result_of_check 

  end
end
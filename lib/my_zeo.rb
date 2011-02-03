class MyZeo
  require 'hash_symbolize_keys'
  require 'httparty'
  include HTTParty

  base_uri "https://api.myzeo.com:8443/zeows/api/v1/sleeperService"
  
  attr_reader :api_key
  attr_reader :user_id
  
  def initialize(api_key,opts={})
    @api_key = api_key
    @user_id = opts[:user_id] ? opts[:user_id] : nil 
    MyZeo.basic_auth opts[:login], opts[:password] if (opts[:login] && opts[:password])
    MyZeo.base_uri opts[:base_url] if opts[:base_url] 
  end

  # BULK API
  # *************************************************************************************************************************************
  def subscribe_to_notify_link(callback_url)
    "#{self.class.base_uri}/subscribeToNotify?key=#{@api_key}&userid=#{@user_id}&callback=#{callback_url}"
  end
  
  def unsubscribe_from_notify_link
    "#{self.class.base_uri}/unsubscribeFromNotify?key=#{@api_key}&userid=#{@user_id}"
  end
  
  def unsubscribe_from_notify
    MyZeo.get("/unsubscribeFromNotify?key=#{@api_key}", :query => {:userid => @user_id}).recursive_symbolize_keys!
  end
  
  def get_bulk_sleep_stats_since_date(opts={})
    date = opts[:date] ? opts[:date] : ""
    MyZeo.get("/getBulkSleepStatsSinceDate?key=#{@api_key}", :query => {:userid => @user_id, :date => date }).recursive_symbolize_keys!
  end
  
  def get_bulk_sleep_records_since_date(opts={})
    date = opts[:date] ? opts[:date] : ""
    MyZeo.get("/getBulkSleepRecordsSinceDate?key=#{@api_key}", :query => {:userid => @user_id, :date => date }).recursive_symbolize_keys!
  end
  
  def j_spring_security_logout
    logout_url_base = self.base_uri.split('/api/').first
    get("#{logout_url_base}/j_spring_security_logout")
  end
  
  # *************************************************************************************************************************************
  
  def get_overall_average_zq_score
    MyZeo.get("/getOverallAverageZQScore?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def get_overall_average_day_feel_score
    MyZeo.get("/getOverallAverageDayFeelScore?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def get_overall_average_morning_feel_score
    MyZeo.get("/getOverallAverageMorningFeelScore?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def get_overall_average_sleep_stealer_score
    MyZeo.get("/getOverallAverageSleepStealerScore?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def get_all_dates_with_sleep_data
    MyZeo.get("/getAllDatesWithSleepData?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def get_dates_with_sleep_data_in_range(opts={})
    date_from = opts[:date_from] ? opts[:date_from] : ""
    date_to = opts[:date_to] ? opts[:date_to] : ""
    MyZeo.get("/getOverallAverageZQScore?key=#{@api_key}", :query => {:dateFrom => date_from, :dateTo => date_to}).recursive_symbolize_keys!
  end
  
  def get_sleep_stats_for_date(opts={})
    date = opts[:date] ? opts[:date] : ""
    MyZeo.get("/getSleepStatsForDate?key=#{@api_key}", :query => {:date => date }).recursive_symbolize_keys!
  end
  
  def get_sleep_record_for_date(opts={})
    date = opts[:date] ? opts[:date] : ""
    MyZeo.get("/getSleepRecordForDate?key=#{@api_key}", :query => {:date => date }).recursive_symbolize_keys!
  end
  
  def get_previous_sleep_stats(opts={})
    date = opts[:date] ? opts[:date] : ""
    MyZeo.get("/getPreviousSleepStats?key=#{@api_key}", :query => {:date => date }).recursive_symbolize_keys!
  end
  
  def get_previous_sleep_record(opts={})
    date = opts[:date] ? opts[:date] : ""
    MyZeo.get("/getPreviousSleepRecord?key=#{@api_key}", :query => {:date => date }).recursive_symbolize_keys!
  end
  
  def get_next_sleep_stats(opts={})
    date = opts[:date] ? opts[:date] : ""
    MyZeo.get("/getNextSleepStats?key=#{@api_key}", :query => {:date => date }).recursive_symbolize_keys!
  end
  
  def get_next_sleep_record(opts={})
    date = opts[:date] ? opts[:date] : ""
    MyZeo.get("/getNextSleepRecord?key=#{@api_key}", :query => {:date => date }).recursive_symbolize_keys!
  end
  
  def get_earliest_sleep_stats
    MyZeo.get("/getEarliestSleepStats?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def get_earliest_sleep_record
    MyZeo.get("/getEarliestSleepRecord?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def get_latest_sleep_stats
    MyZeo.get("/getLatestSleepStats?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def get_latest_sleep_record
    MyZeo.get("/getLatestSleepRecord?key=#{@api_key}").recursive_symbolize_keys!
  end
  
  def logout
    MyZeo.get("/logout?key=#{@api_key}")
  end
  
  def secure_logout
    MyZeo.get("#{self.class.base_uri.split('/api/').first}/j_spring_security_logout")
  end
  
  
end